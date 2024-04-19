import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:midassist/screens/signInPage.dart';
import 'package:midassist/screens/signUpPage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/s2 (2).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 350),
              child: Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    children: [
                      Text(
                          'Empowering your health journey, one click at a time.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.25,
                            fontSize: 35,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: 40,
                        height: 40,
                      ),
                      Text(
                          'MedAssist, unlocking the secrets to glowing skin, one personalized recommendation at a time.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ))
                    ],
                  )),
            ),
            const SizedBox(
              width: 60,
              height: 90,
            ),
            Align(
              alignment:
              const Alignment(0, 0.7), // Aligning to the desired position
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp_Page(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004080),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
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