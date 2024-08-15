import 'package:flutter/material.dart';
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:http/http.dart' as http;
import 'image_result.dart';

class ImageUploaderPage extends StatefulWidget {
  const ImageUploaderPage({
    super.key,
    required this.imageFilePicker,
    required this.client,
    required this.userId,
    required this.selectedBodyPart,
  });

  final ImageFilePicker imageFilePicker;
  final http.Client client;
  final int userId;
  final String selectedBodyPart;

  @override
  State<ImageUploaderPage> createState() => _ImageUploaderPageState();
}

class _ImageUploaderPageState extends State<ImageUploaderPage> {
  bool _isUploading = false;

  void _onImagePressed() async {
    setState(() {
      _isUploading = true;
    });

    Map<String, dynamic>? response = await openImagePickerDialog(
      widget.imageFilePicker,
      widget.client,
      widget.userId,
    );

    setState(() {
      _isUploading = false;
    });

    if (response != null) {
      int? statusCode = response['statusCode'];
      if (statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageResult(
              imageData: response['data'], // Assuming you want to pass the data
            ),
          ),
        );
      } else {
        _showErrorDialog(response['data']);
      }
    } else {
      _showErrorDialog("Failed to upload image. Please try again.");
    }
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
        title: Text("Upload Image (${widget.selectedBodyPart})"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _onImagePressed,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Upload via Camera'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _onImagePressed,
              icon: const Icon(Icons.photo_library),
              label: const Text('Upload via Gallery'),
            ),
            if (_isUploading)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
