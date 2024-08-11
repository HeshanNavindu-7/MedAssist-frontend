import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:midassist/screens/profilepage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      print("File path: $filePath");
    } else {
      // User canceled the picker
    }
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
                        builder: (context) => const ProfilePage(),
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
              child: Container(
                width: 200,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Center(
                  child: Text(
                    'Change Profile Photo',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
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
          Positioned(
            top: 655,
            left: 70,
            child: GestureDetector(
              onTap: () {
                // Handle the 'Book appointment' action here
              },
              child: Container(
                width: 250,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Center(
                  child: Text(
                    'Edit my profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
