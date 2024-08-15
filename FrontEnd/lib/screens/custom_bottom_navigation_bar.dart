import 'package:flutter/material.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/pdfuploader.dart';
import 'package:midassist/screens/imageUploder.dart'; // Ensure this path is correct
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/APIs/imageFilePicker.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageFilePicker imageFilePicker = ImageFilePicker();
    final http.Client client = http.Client();

    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Color(0xFFADD8E6), // Light blue color
      height: 60, // Adjusted height within the acceptable range
      items: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          child: Icon(Icons.home, size: 30, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PdfUploader()),
            );
          },
          child: Icon(Icons.picture_as_pdf, size: 30, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageUploader(
                  imageFilePicker: imageFilePicker, 
                  client: client,
                ),
              ),
            );
          },
          child: Icon(Icons.camera_alt, size: 30, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedAssistAi()),
            );
          },
          child: Icon(Icons.lightbulb_outline, size: 30, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Icon(Icons.person, size: 20, color: Colors.black),
        ),
      ],
      onTap: (index) {
        // Handle navigation index if needed
      },
    );
  }
}
