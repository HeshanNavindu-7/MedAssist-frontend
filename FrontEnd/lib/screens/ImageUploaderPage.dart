import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:midassist/utils/imageFilePicker.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/brain_tumor_model_page.dart';
import 'package:midassist/screens/image_result.dart';
import 'package:midassist/utils/user_session.dart';

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
  bool _isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    try {
      UserSession userSession = UserSession();

      // Access tokens
      String? token = userSession.accessToken;

      // Access user details
      Map<String, dynamic>? userDetails = userSession.userDetails;
      userId = userDetails?['id'];
      setState(() {
        _isLoading = false;
      });

      print('User ID: ${userDetails?['id']}');
      // print('Username: ${userDetails?['name']}');
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching user ID: $e');
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
            userId: userId!,
            selectedBodyPart: selectedBodyPart!,
          ),
        ),
      );
    } else {
      if (userId == null) {
        print('User ID is still being fetched. Please wait.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('User ID is still being fetched. Please wait.')),
        );
      } else if (selectedBodyPart == null) {
        print('No body part selected');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please select a body part before proceeding.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Display a loading indicator while user ID is being fetched
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (userId != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BrainTumorUploadPage(
                        imageFilePicker: widget.imageFilePicker,
                        client: widget.client,
                        userId: userId!,
                      ),
                    ),
                  );
                } else {
                  print('User ID is still being fetched. Please wait.');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('User ID is still being fetched. Please wait.'),
                    ),
                  );
                }
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
                        'Our advanced detection system can accurately identify and classify brain tumors into categories such as glioma, meningioma, pituitary adenomas, or confirm if there is no tumor present.',
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
                        'Our system can display and analyze chest X-ray samples, clearly distinguishing between NORMAL and PNEUMONIA cases.',
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
                  key: UniqueKey(),
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

  Future<void> _onImagePressed() async {
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
              imageData: response['data'], // Pass the image data to ImageResult
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
      body: Center(
        // Center aligns all content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Vertically centers children
          crossAxisAlignment:
              CrossAxisAlignment.center, // Horizontally centers children
          children: [
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _onImagePressed,
              icon: const Icon(Icons.camera_alt, size: 40), // Larger icon
              label: const Text(
                'Upload via Camera',
                style: TextStyle(fontSize: 20), // Larger text
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 70), // Bigger button
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              ),
            ),
            const SizedBox(height: 24.0), // Increased spacing
            ElevatedButton.icon(
              onPressed: _isUploading ? null : _onImagePressed,
              icon: const Icon(Icons.photo_library, size: 40), // Larger icon
              label: const Text(
                'Upload via Gallery',
                style: TextStyle(fontSize: 20), // Larger text
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 70), // Bigger button
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              ),
            ),
            if (_isUploading)
              const Padding(
                padding: EdgeInsets.only(top: 30.0), // Spacing for the loader
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
