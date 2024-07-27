import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      print("File path: $filePath");
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 25,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //back button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/back.png'),
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                //market text
                const Text(
                  'Profile Update',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Positioned(
              top: 80,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Edit Your Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ))),
          const Positioned(
            top: 140,
            left: 50,
            child: Image(image: AssetImage('assets/profilegirl.png')),
          ),
          Positioned(
            top: 150,
            left: 150,
            child: GestureDetector(
              onTap: _pickFile,
              child: const Image(
                image: AssetImage('assets/lastprofile.png'),
              ),
            ),
          ),
          const Positioned(
              top: 240,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          Positioned(
            top: 275,
            left: 10,
            right: 10,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const Positioned(
              top: 340,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Age',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          Positioned(
            top: 375,
            left: 10,
            right: 10,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your age',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const Positioned(
              top: 440,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Height',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          Positioned(
            top: 475,
            left: 10,
            right: 10,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your height',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const Positioned(
              top: 540,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Weight',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          Positioned(
            top: 575,
            left: 10,
            right: 10,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your weight',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const Positioned(
              top: 680,
              left: 40,
              child: Image(
                  image: AssetImage(
                'assets/profilebutton.png',
              ))),
        ],
      ),
    );
  }
}
