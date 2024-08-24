import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:midassist/screens/brain_tumor_result.dart';

class BrainTumorUploadPage extends StatefulWidget {
  const BrainTumorUploadPage({
    super.key,
    required this.imageFilePicker,
    required this.client,
    required this.userId,
  });

  final ImageFilePicker imageFilePicker;
  final http.Client client;
  final int userId;

  @override
  State<BrainTumorUploadPage> createState() => _BrainTumorUploadPageState();
}

class _BrainTumorUploadPageState extends State<BrainTumorUploadPage> {
  bool _isUploading = false;
  String? predictedClass;

  void _uploadImage() async {
    setState(() {
      _isUploading = true;
    });

    // Pick the image using the imageFilePicker
    Map<String, dynamic>? imageData = await openImagePickerDialog(
      widget.imageFilePicker,
      widget.client,
      widget.userId,
    );

    if (imageData != null) {
      // Create the request payload
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://0.0.0.0:8000/upload_image/'),
      );

      request.fields['user'] = widget.userId.toString();
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imageData['path'],
      ));

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var jsonResponse = jsonDecode(responseData.body);

        setState(() {
          predictedClass = jsonResponse['predicted_class'];
        });

        // Navigate to the ImageResult page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Brain_Tumor_result(
              imageData: jsonResponse['image'],
              predictedClass: jsonResponse['predicted_class'],
            ),
          ),
        );
      } else {
        _showErrorDialog("Failed to upload image. Please try again.");
      }
    } else {
      _showErrorDialog("No image selected. Please try again.");
    }

    setState(() {
      _isUploading = false;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text("Upload Image - Brain Tumor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _uploadImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Upload via Camera'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _uploadImage,
              icon: const Icon(Icons.photo_library),
              label: const Text('Upload via Gallery'),
            ),
            if (_isUploading)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: CircularProgressIndicator(),
              ),
            if (predictedClass != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Predicted Class: $predictedClass',
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
