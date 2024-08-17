import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/signInPage.dart';
import 'home.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp_Page> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String phoneNumberErrorText = '';
  bool rememberMe = false;

  Future<void> signUp() async {
    // Your backend endpoint URL
    String url = 'http://192.168.8.135:8000/sign-up/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'name': firstNameController.text,
          'age': ageController.text,
          'email': emailController.text,
          'phone_number': phoneNumberController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 201) {
        // Request successful
        print('Sign up successful');
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Newback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment(-1, -0.5),
                          child: Padding(
                            padding: EdgeInsets.only(top: 50.0, left: 130),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        //firstName
                        Align(
                          alignment: const Alignment(0, 0.06),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
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
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person,
                                      color: Colors.white),
                                  hintText: 'Full Name',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(200, 255, 255, 255),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled:
                                      false, // Set to false for transparency
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //Age
                        Align(
                          alignment: const Alignment(0, 0.06),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
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
                                controller: ageController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.calendar_month,
                                      color: Colors.white),
                                  hintText: 'Age',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(200, 255, 255, 255),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled:
                                      false, // Set to false for transparency
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Email Address
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
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
                                controller: emailController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email,
                                      color: Colors.white),
                                  hintText: 'E-Mail',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(200, 255, 255, 255),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled:
                                      false, // Set to false for transparency
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Phone Number
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
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
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.call,
                                      color: Colors.white),
                                  hintText: 'Phone Number',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(200, 255, 255, 255),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled:
                                      false, // Set to false for transparency
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Password
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Colors.white),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(200, 255, 255, 255),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled:
                                      false, // Set to false for transparency
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Confirm Password
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Colors.white),
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(200, 255, 255, 255),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled:
                                      false, // Set to false for transparency
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Remember Me'),
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (firstNameController.text.isEmpty ||
                                ageController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                phoneNumberController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              // Show error message if any required field is empty
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'Please fill in all required fields.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (phoneNumberErrorText.isNotEmpty) {
                              // Show error message if phone number is invalid
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: Text(phoneNumberErrorText),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // All fields are filled and phone number is valid, proceed with sign-up
                              signUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 30, 71, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15), // Padding
                          ), // Change button color here
                          child: const Text(
                            'Sign Up ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Row(children: [
                    const SizedBox(
                      width: 80,
                    ),
                    const Text("If you already have an account,"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignInPage()), // Corrected class name
                          );
                        },
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                            color: Color.fromARGB(255, 18, 76, 236),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 18, 76, 236),
                          ),
                        )),
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
