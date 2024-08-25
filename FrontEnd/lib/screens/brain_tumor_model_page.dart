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

    if (imageData != null && imageData['statusCode'] == 201) {
      // Extract the predicted_class directly from the response
      String? predictedClass = imageData['data']['predicted_class']?.toString();

      if (predictedClass == null) {
        _showErrorDialog("Failed to retrieve valid data from the server.");
      } else {
        setState(() {
          this.predictedClass = predictedClass;
        });

        // Navigate to the BrainTumorResult page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Brain_Tumor_result(
              predictedClass: predictedClass,
            ),
          ),
        );
      }
    } else {
      _showErrorDialog("Failed to upload image. Please try again.");
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
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 173, 216, 230), Color.fromARGB(255, 225, 245, 254)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _uploadImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Upload via Camera'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _uploadImage,
              icon: const Icon(Icons.photo_library),
              label: const Text('Upload via Gallery'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
