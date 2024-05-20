import 'package:flutter/material.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';
import 'package:midassist/screens/market.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

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
                //back bitton
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Market(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/back.png'),
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          //image
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Image(image: AssetImage('assets/beauty.png')),
              ),
              //text
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Boston Round Full Package',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: Text(
                      'Rs. 5625/=',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Image(image: AssetImage('assets/Rating.png'))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'The Boston Round Full Package offers a complete solution for skincare enthusiasts, featuring both cream and body lotion packaged in sleek, durable Boston Round bottles. These bottles, renowned for their classic cylindrical design and ease of use, ensure optimal product preservation and convenience. '),
              )
            ],
          ),
          //Navigation Bar
          Positioned(
            top: 728,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          )
        ],
      ),
    );
  }
}
