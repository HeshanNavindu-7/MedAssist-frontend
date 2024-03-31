import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment(-1, -0.5),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF423838),
                      ),
                    ),
                  ),
                ),
                //Username
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Username',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.blue, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF282635).withOpacity(0.5),
                      ),
                    ),
                  ),
                ),

                //Password
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.blue, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF282635).withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  //uncomment following comment when testing with backend
                  // onPressed: signUp,

                  //Only testing purpose (Front end testing)
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()), // Corrected class name
                    );
                  },
                  //end of the testing code


                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // Padding
                  ), // Change button color here
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
