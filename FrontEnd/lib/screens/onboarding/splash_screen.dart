import 'package:flutter/material.dart';
import 'package:midassist/screens/onboarding/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
        child: Align(
          alignment: const Alignment(0, 0.8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const WelcomeScreen()), // Corrected class name
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF004080),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // Padding
            ), // Change button color here

            child: const Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ), // Updated button text
          ),
        ),
      ),
    );
  }
}