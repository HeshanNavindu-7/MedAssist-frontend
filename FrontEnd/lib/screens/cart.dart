import 'package:flutter/material.dart';
import 'package:midassist/screens/salesitem.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/market.dart'; // Ensure this import is present
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

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
                  width: 100,
                ),
                const Text(
                  'My Cart',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            left: 25,
            right: 25,
            child: Row(
              children: [
                _buildNavigation(
                  'assets/beauty.png',
                  'Market',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Market()),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          )
        ],
      ),
    );
  }

  Widget _buildNavigation(String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 180,
          height: 150, // Adjust the width and height as needed
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 100, // Adjust the height as needed
                width: 100, // Adjust the width as needed
              ),
              const SizedBox(height: 8.0), // Space between image and text
              Text(
                label,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
