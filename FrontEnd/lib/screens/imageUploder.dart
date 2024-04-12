import 'package:flutter/material.dart';
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:http/http.dart' as http;
import 'image_result.dart';

final buttonKey = UniqueKey();
final imageKey = UniqueKey();

class ImageUploder extends StatefulWidget {
  const ImageUploder(
      {super.key, required this.imageFilePicker, required this.client});

  final ImageFilePicker imageFilePicker;
  final http.Client client;

  @override
  State<ImageUploder> createState() => _ImageUploderState();
}

class _ImageUploderState extends State<ImageUploder> {
  String? imageURL;

  /// Called when the image is pressed.
  /// It invokes `openImagePickerDialog`, which opens a dialog to select an image and makes the request to upload the image.
  void _onImagePressed() async {
    Map<String, dynamic>? response = await openImagePickerDialog(widget.imageFilePicker, widget.client);

    if (response != null) {
      int? statusCode = response['statusCode'];
      if (statusCode == 201) {
        // Image uploaded successfully, navigate to ImageResult page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageResult(),
          ),
        );
      } else {
        // Show error message or handle other status codes accordingly
        print('Error: ${response['data']}');
        // Show a snackbar or dialog with the error message
      }
    } else {
      // User canceled the picker
      var statusCode = response?['statusCode'];
      print(statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Image Upload Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Elevated button to open file picker
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: ElevatedButton(
                    key: buttonKey,
                    onPressed: _onImagePressed,
                    child: const Text("Upload image"),
                  ),
                ),
              ],
            ),

            // Render image
            /* Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageURL != null
                    // Image URL is defined
                    ? [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Column(children: [
                              Text(
                                "Here's your uploaded image!",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Text("It's living on the web."),
                            ])),
                        Image.network(
                          key: imageKey,
                          imageURL!,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ]
                    :
                    // No image URL is defined
                    [const Text("No image has been uploaded.")],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
