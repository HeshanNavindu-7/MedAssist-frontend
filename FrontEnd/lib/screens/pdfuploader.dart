import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/pdf_result.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class PdfUploader extends StatefulWidget {
  const PdfUploader({Key? key}) : super(key: key);

  @override
  State<PdfUploader> createState() => _PdfUploaderState();
}

class _PdfUploaderState extends State<PdfUploader> {
  int? userId;
  bool isLoading = false;
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _fetchUserId();
    _initializeCamera();
  }

  Future<void> _fetchUserId() async {
    final response = await http.get(Uri.parse('http://192.168.8.172:8000/users/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userId = data['id'];
      });
    } else {
      print('Failed to fetch user ID: ${response.statusCode}');
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _cameraController?.initialize();
    setState(() {});
  }

  Future<void> _captureAndUploadPhoto(BuildContext context) async {
    try {
      if (_cameraController != null && userId != null) {
        setState(() {
          isLoading = true;
        });

        await _initializeControllerFuture;

        final image = await _cameraController!.takePicture();
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/${DateTime.now()}.jpg';
        final imageFile = File(imagePath);
        await imageFile.writeAsBytes(await image.readAsBytes());

        var request = http.MultipartRequest(
          'POST',
          Uri.parse('http://192.168.8.172:8000/upload_photo/'),
        );

        request.files.add(
          await http.MultipartFile.fromPath('photo', imageFile.path),
        );
        request.fields['user'] = userId.toString();

        var response = await request.send();

        if (response.statusCode == 201) {
          final responseData = await response.stream.bytesToString();
          final jsonResponse = jsonDecode(responseData);
          final serverResponse = jsonResponse['response'];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Pdf_Result(responseData: serverResponse),
            ),
          );
        } else {
          print('Failed to upload photo: ${response.statusCode}');
        }
      } else {
        print('User ID or Camera Controller is null, cannot capture photo');
      }
    } catch (e) {
      print('Error capturing and uploading photo: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _uploadPdf(BuildContext context) async {
    try {
      if (userId != null) {
        setState(() {
          isLoading = true;
        });

        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );

        if (result != null) {
          File file = File(result.files.single.path!);

          var request = http.MultipartRequest(
            'POST',
            Uri.parse('http://192.168.8.172:8000/upload_pdf/'),
          );

          request.files.add(
            await http.MultipartFile.fromPath('pdf_file', file.path),
          );
          request.fields['user'] = userId.toString();

          var response = await request.send();

          if (response.statusCode == 201) {
            final responseData = await response.stream.bytesToString();
            final jsonResponse = jsonDecode(responseData);
            final serverResponse = jsonResponse['response'];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pdf_Result(responseData: serverResponse),
              ),
            );
          } else {
            print('Failed to upload PDF: ${response.statusCode}');
          }
        }
      } else {
        print('User ID is null, cannot upload PDF');
      }
    } catch (e) {
      print('Error uploading PDF: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera and PDF Uploader'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cameraController != null &&
                          _cameraController!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _cameraController!.value.aspectRatio,
                          child: CameraPreview(_cameraController!),
                        )
                      : CircularProgressIndicator(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _captureAndUploadPhoto(context),
                    child: Text('Capture and Upload Photo'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _uploadPdf(context),
                    child: Text('Upload PDF'),
                  ),
                ],
              ),
      ),
    );
  }
}
