import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/signUpPage.dart';
import 'home.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false; // Define the checkbox state

  Future<void> signIn() async {
    // Your backend endpoint URL
    String url = 'http://192.168.8.135:8000/sign-in/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': usernameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        // Request successful
        final responseData = jsonDecode(response.body);
        final userId = responseData['user_id'];
        print(userId);
        print('Sign in successful');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // Request failed
        print('Sign up failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/SignIn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
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
                          color: Color.fromARGB(255, 58, 57, 57),
                        ),
                      ),
                    ),
                  ),
                  // Username
                  Align(
                    alignment: const Alignment(0, 0.06),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 7, 81),
                              Color.fromARGB(255, 75, 117, 190)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.white),
                            hintText: 'Username',
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(200, 255, 255, 255),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: false, // Set to false for transparency
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Password
                  Align(
                    alignment: const Alignment(0, 0.06),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 7, 81),
                              Color.fromARGB(255, 75, 117, 190)
                            ], // Gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(200, 255, 255, 255),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: false, // Set to false for transparency
                          ),
                          style: const TextStyle(
                              color: Colors.white), // Text color
                          obscureText: true, // Hide password text
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0), // Add margin on the left
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text('Remember Me'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 30.0), // Add margin on the right
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 18, 76, 236),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 18, 76, 236),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: signIn,

                    //uncomment following comment when testing with backend
                    //onPressed: signIn,

                    //Only testing purpose (Front end testing)
                    // onPressed: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             Home()), // Corrected class name
                    //   );
                    // },
                    //end of the testing code

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 7, 81),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Border radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // Padding
                    ), // Change button color here
                    child: const Text(
                      'Sign In',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 80),
                        const Text("Don't have an account?"),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp_Page(),
                              ),
                            );
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 76, 236),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 18, 76, 236),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('or'),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/fb.png'), // Replace 'assetName' with your actual asset path
                          width: 20, // Adjust width as needed
                          height: 20, // Adjust height as needed
                        ),
                        SizedBox(width: 30), // Space between image and text
                        Text("LogIn with Facebook"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 300,
                    height: 50,
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/google.png'), // Replace 'assetName' with your actual asset path
                          width: 20, // Adjust width as needed
                          height: 20, // Adjust height as needed
                        ),
                        SizedBox(width: 35), // Space between image and text
                        Text("LogIn with Google"),
                      ],
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
