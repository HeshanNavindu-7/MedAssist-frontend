import 'package:flutter/material.dart';
import 'package:midassist/screens/appointmentdetails.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Pay extends StatelessWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //Background
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profile2.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
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
                        width: 45,
                      ),
                      //market text
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    top: 100,
                    left: 120,
                    child: Column(
                      children: [
                        Text(
                          'Rs. 16200/=',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 255, 50, 43)),
                        ),
                        Text(
                          'Goods and Services',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Ref.458962155654833541',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )),
                //Navigation Bar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CustomBottomNavigationBar(),
                )
              ],
            )));
  }
}
