import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:http/http.dart' as http;
import 'image_result.dart';

final buttonKey = UniqueKey();
final imageKey = UniqueKey();

class ImageUploader extends StatefulWidget {
  const ImageUploader({
    super.key,
    required this.imageFilePicker,
    required this.client,
  });

  final ImageFilePicker imageFilePicker;
  final http.Client client;

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  String? imageURL;
  int? userId;
  String? selectedBodyPart; // Track selected body part

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/users/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userId = data['id'];
        print(userId);
      });
    } else {
      print('Failed to fetch user ID: ${response.statusCode}');
    }
  }

  void _onNextPressed() {
    if (userId != null && selectedBodyPart != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageUploaderPage(
            imageFilePicker: widget.imageFilePicker,
            client: widget.client,
            userId: userId!, // Safe to use `!` here since we're checking for null
            selectedBodyPart: selectedBodyPart!,
          ),
        ),
      );
    } else {
      if (userId == null) {
        print('User ID is still being fetched. Please wait.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User ID is still being fetched. Please wait.')),
        );
      } else if (selectedBodyPart == null) {
        print('No body part selected');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a body part before proceeding.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text("Image Analyzer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Body Parts',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedBodyPart = 'Brain Tumor';
                });
              },
              child: Card(
                margin: const EdgeInsets.all(12.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: selectedBodyPart == 'Brain Tumor'
                    ? Colors.lightBlue[50]
                    : null, // Highlight the card if selected
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Brain Tumor',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'This section will display an overview of the analysis once the image is processed.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedBodyPart = 'Chest X Ray';
                });
              },
              child: Card(
                margin: const EdgeInsets.all(12.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: selectedBodyPart == 'Chest X Ray'
                    ? Colors.lightBlue[50]
                    : null, // Highlight the card if selected
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chest X Ray',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'This section will display an overview of the analysis once the image is processed.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (userId != null && selectedBodyPart != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: ElevatedButton(
                  key: buttonKey,
                  onPressed: _onNextPressed,
                  child: const Text("Next"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

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
