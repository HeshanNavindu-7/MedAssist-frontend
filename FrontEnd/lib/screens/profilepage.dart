import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profileback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(
                image: AssetImage('assets/Bottom_rectangle.png'),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              right: 5,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 20),
                    child: Image(image: AssetImage('assets/Home.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 40),
                    child: Image(image: AssetImage('assets/Market.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 30),
                    child: Image(image: AssetImage('assets/Camera.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 40),
                    child: Image(image: AssetImage('assets/GlovaAI.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 30),
                    child: Image(image: AssetImage('assets/Profile.png')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
