import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:convert';

class PdfUploader extends StatefulWidget {
  const PdfUploader({Key? key});

  @override
  State<PdfUploader> createState() => _PdfUploader();
}

class _PdfUploader extends State<PdfUploader> {
  int? userId;

  @override
  void initState() {
    super.initState();
    _fetchUserId(); // Fetch user ID when the widget is initialized
  }

  Future<void> _fetchUserId() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/users/'));

    if (response.statusCode == 200) {
      // Parse the response JSON
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userId = data['id'];
        print(userId);
      });
    } else {
      // Handle error
      print('Failed to fetch user ID: ${response.statusCode}');
    }
  }

  Future<void> _uploadPdf(BuildContext context) async {
    try {
      if (userId != null) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );

        if (result != null) {
          File file = File(result.files.single.path!);
          String fileName = basename(file.path);

          var request = http.MultipartRequest(
            'POST',
            Uri.parse('http://10.0.2.2:8000/upload_pdf/'),
          );

          request.files.add(
            await http.MultipartFile.fromPath('pdf_file', file.path),
          );
          request.fields['user'] = userId != null ? userId.toString() : '';

          // Print the request details
          print('Request URL: ${request.url}');
          print('Request Headers: ${request.headers}');
          print('Request Body: ${request.fields}');

          var response = await request.send();

          if (response.statusCode == 201) {
            print('PDF uploaded successfully');
          } else {
            print('Failed to upload PDF: ${response.statusCode}');
          }
        }
      } else {
        print('User ID is null, cannot upload PDF');
      }
    } catch (e) {
      print('Error uploading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Uploader'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _uploadPdf(context),
          child: Text('Upload PDF'),
        ),
      ),
    );
  }
}
