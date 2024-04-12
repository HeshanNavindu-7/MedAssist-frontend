import 'package:flutter/material.dart';
import 'package:midassist/screens/secondPage.dart';

class ImageResult extends StatelessWidget {
  const ImageResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/landingPage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:const Center(
        child: Text("Result"),
        ),
        ),
      );
  }
}
