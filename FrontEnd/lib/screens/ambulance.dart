import 'package:flutter/material.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Ambulance extends StatelessWidget {
  const Ambulance({Key? key}) : super(key: key);

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
                  width: 65,
                ),
                //market text
                const Text(
                  'Ambulance',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const Positioned(
              top: 200,
              left: 65,
              child: Image(image: AssetImage('assets/1919.png'))),

          const Positioned(
              top: 500,
              left: 45,
              child: Text(
                'Call an emergency service vehicle',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 253, 0, 0),
                    fontWeight: FontWeight.bold),
              )),
          //Navigation Bar
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
}
