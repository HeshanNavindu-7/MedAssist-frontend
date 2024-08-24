// import 'dart:io';
// import 'package:flutter/material.dart';
// // import 'package:camera/camera.dart'; // Camera package imported but usage commented out
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:midassist/screens/pdf_result.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:convert';

// class PdfUploader extends StatefulWidget {
//   const PdfUploader({Key? key}) : super(key: key);

//   @override
//   State<PdfUploader> createState() => _PdfUploaderState();
// }

// class _PdfUploaderState extends State<PdfUploader> {
//   int? userId;
//   bool isLoading = false;
//   // CameraController? _cameraController; // CameraController declared but usage commented out
//   // Future<void>? _initializeControllerFuture; // Future for initializing the camera commented out

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserId();
//     // _initializeCamera(); // Camera initialization commented out
//   }

//   Future<void> _fetchUserId() async {
//     final response =
//         await http.get(Uri.parse('http://192.168.1.2:8000/users/'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       setState(() {
//         userId = data['id'];
//       });
//     } else {
//       print('Failed to fetch user ID: ${response.statusCode}');
//     }
//   }

//   // Future<void> _initializeCamera() async { // Camera initialization method commented out
//   //   final cameras = await availableCameras();
//   //   final firstCamera = cameras.first;

//   //   _cameraController = CameraController(
//   //     firstCamera,
//   //     ResolutionPreset.high,
//   //   );

//   //   _initializeControllerFuture = _cameraController?.initialize();
//   //   setState(() {});
//   // }

//   // Future<void> _captureAndUploadPhoto(BuildContext context) async { // Photo capture method commented out
//   //   try {
//   //     if (_cameraController != null && userId != null) {
//   //       setState(() {
//   //         isLoading = true;
//   //       });

//   //       await _initializeControllerFuture;

//   //       final image = await _cameraController!.takePicture();
//   //       final directory = await getApplicationDocumentsDirectory();
//   //       final imagePath = '${directory.path}/${DateTime.now()}.jpg';
//   //       final imageFile = File(imagePath);
//   //       await imageFile.writeAsBytes(await image.readAsBytes());

//   //       var request = http.MultipartRequest(
//   //         'POST',
//   //         Uri.parse('http://192.168.1.2:8000/upload_photo/'),
//   //       );

//   //       request.files.add(
//   //         await http.MultipartFile.fromPath('photo', imageFile.path),
//   //       );
//   //       request.fields['user'] = userId.toString();

//   //       var response = await request.send();

//   //       if (response.statusCode == 201) {
//   //         final responseData = await response.stream.bytesToString();
//   //         final jsonResponse = jsonDecode(responseData);
//   //         final serverResponse = jsonResponse['response'];

//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //             builder: (context) => Pdf_Result(responseData: serverResponse),
//   //           ),
//   //         );
//   //       } else {
//   //         print('Failed to upload photo: ${response.statusCode}');
//   //       }
//   //     } else {
//   //       print('User ID or Camera Controller is null, cannot capture photo');
//   //     }
//   //   } catch (e) {
//   //     print('Error capturing and uploading photo: $e');
//   //   } finally {
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //   }
//   // }

//   Future<void> _uploadPdf(BuildContext context) async {
//     try {
//       if (userId != null) {
//         setState(() {
//           isLoading = true;
//         });

//         FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.custom,
//           allowedExtensions: ['pdf'],
//         );

//         if (result != null) {
//           File file = File(result.files.single.path!);

//           var request = http.MultipartRequest(
//             'POST',
//             Uri.parse('http://192.168.1.2:8000/upload_pdf/'),
//           );

//           request.files.add(
//             await http.MultipartFile.fromPath('pdf_file', file.path),
//           );
//           request.fields['user'] = userId.toString();

//           var response = await request.send();

//           if (response.statusCode == 201) {
//             final responseData = await response.stream.bytesToString();
//             final jsonResponse = jsonDecode(responseData);
//             final serverResponse = jsonResponse['response'];

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Pdf_Result(responseData: serverResponse),
//               ),
//             );
//           } else {
//             print('Failed to upload PDF: ${response.statusCode}');
//           }
//         }
//       } else {
//         print('User ID is null, cannot upload PDF');
//       }
//     } catch (e) {
//       print('Error uploading PDF: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     // _cameraController?.dispose(); // CameraController disposal commented out
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 173, 216, 230),
//         centerTitle: true,
//         title: Text(' PDF Uploader'),
//       ),
//       body: Center(
//         child: isLoading
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // _cameraController != null &&
//                   //         _cameraController!.value.isInitialized
//                   //     ? AspectRatio(
//                   //         aspectRatio: _cameraController!.value.aspectRatio,
//                   //         child: CameraPreview(_cameraController!),
//                   //       )
//                   //     : CircularProgressIndicator(), // Camera preview commented out
//                   SizedBox(height: 20),
//                   // ElevatedButton(
//                   //   onPressed: () => _captureAndUploadPhoto(context),
//                   //   child: Text('Capture and Upload Photo'),
//                   // ), // Button for capturing photo commented out
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () => _uploadPdf(context),
//                     child: Text('Upload PDF'),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
// updated code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/pdf_result.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart'; // Import your custom bottom navigation bar here

class PdfUploader extends StatefulWidget {
  const PdfUploader({Key? key}) : super(key: key);

  @override
  State<PdfUploader> createState() => _PdfUploaderState();
}

class _PdfUploaderState extends State<PdfUploader> {
  int? userId;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.2:8000/users/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userId = data['id'];
      });
    } else {
      print('Failed to fetch user ID: ${response.statusCode}');
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
            Uri.parse('http://192.168.1.2:8000/upload_pdf/'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        centerTitle: true,
        title: Text('PDF Uploader'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Medical Report Analysis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'MedAssist employs state-of-the-art algorithms to interpret medical reports, breaking down complex terminology into user-friendly explanations, ensuring that individuals can comprehend their health information more easily.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => _uploadPdf(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(255, 0, 7, 81), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30), // Padding
                      ),
                      child: const Text(
                        'Upload PDF',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Add the bottom navigation bar here
    );
  }
}
