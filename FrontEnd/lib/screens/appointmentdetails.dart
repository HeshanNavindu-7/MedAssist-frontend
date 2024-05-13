import 'package:flutter/material.dart';
import 'package:midassist/screens/myappointments.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class AppDet extends StatelessWidget {
  const AppDet({Key? key}) : super(key: key);

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
                        builder: (context) => const MyAppo(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/back.png'),
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                //appointment details text
                const Text(
                  'Appointment Details',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          //doctor photo
          const Positioned(
            top: 90,
            left: 25,
            child: Image(
              image: AssetImage(
                'assets/Doctor1.png',
              ),
              width: 150,
              height: 150,
            ),
          ),
          //doctor details
          const Positioned(
            top: 100,
            left: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Marcus Holmes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Viralogist',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '1km away',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '+94 70 123 456 7',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/calender.jpg',
                      ),
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [Text('2024 July 07'), Text('10am-12am')],
                    )
                  ],
                ),
              ],
            ),
          ),
          //Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
