import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp_Page> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String phoneNumberErrorText = '';

  Future<void> signUp() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String age = ageController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;

    // Your backend endpoint URL
    String url = 'http://10.0.2.2:8000/sign-up/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'age': ageController.text,
          'email': emailController.text,
          'contact_number': phoneNumberController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 201) {
        // Request successful
        print('Sign up successful');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
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
      body: Stack(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigate back to the previous screen when the button is pressed
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF423838),
                      ),
                    ),
                  ),
                ),
                //firstName
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'First Name',
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
                //last name
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Last Name',
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
                //Age
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_today),
                        hintText: 'Age',
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
                //Email Address
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Email',
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
                //Phone Number
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: 'Phone Number',
                        errorText: phoneNumberErrorText,
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
                      onChanged: (value) {
                        if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                          setState(() {
                            phoneNumberErrorText =
                                'Please enter a valid phone number';
                          });
                        } else {
                          setState(() {
                            phoneNumberErrorText = '';
                          });
                        }
                      },
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
                  /* onPressed: () {
                    if (firstNameController.text.isEmpty ||
                        lastNameController.text.isEmpty ||
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
                                child: Text('OK'),
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
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // All fields are filled and phone number is valid, proceed with sign-up
                      signUp();
                    }
                  },*/

                  //Only testing purpose (Front end testing)
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Home()), // Corrected class name
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
                  child: const Text('Sign Up '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
