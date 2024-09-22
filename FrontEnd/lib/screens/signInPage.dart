import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/signUpPage.dart';
import 'package:midassist/screens/forgotpassword.dart';
import 'home.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false; // Checkbox state
  // String? errorMessage; // Combined error message (outside error handling)

  Future<void> signIn() async {
    // Your backend endpoint URL
    String baseUrl = dotenv.env['API_URL'] ?? ''; 
    String url = '$baseUrl/sign-in/';

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
        print('User ID: $userId');
        print('Sign in successful');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // Request failed
        print('Sign in failed with status: ${response.statusCode}');
        setState(() {
          //  errorMessage = 'Sign in failed. Please check your credentials.'; // Setting error message for request failure (outside error handling)
        });
      }
    } catch (e) {
      // Error occurred
      print('Error: $e');
      setState(() {
        // errorMessage = 'An error occurred. Please try again.'; // Setting error message for exceptions (outside error handling)
      });
    }
  }

  void validateForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      setState(() {
        // errorMessage = null; // Clear error message if validation passes (inside error handling)
      });
      signIn();
    } else {
      setState(() {
        // Combine validation error messages (inside error handling)
        //  errorMessage = [
        //   validateEmail(usernameController.text),
        //   validatePassword(passwordController.text),
        // ].where((msg) => msg != null).join('\n');
      });
    }
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required'; // Error message for empty email (inside error handling)
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Enter a valid email address'; // Error message for invalid email (inside error handling)
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required'; // Error message for empty password (inside error handling)
    }
    return null;
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
              child: Form(
                key: _formKey,
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
                          child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.person, color: Colors.white),
                              hintText: 'User Email',
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
                            validator: (value) => validateEmail(
                                value!), // Error message from validation method (inside error handling)
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
                          child: TextFormField(
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
                              filled: false,
                            ),
                            style: const TextStyle(
                                color: Colors.white), // Text color
                            obscureText: true, // Hide password text
                            validator: (value) => validatePassword(
                                value!), // Error message from validation method (inside error handling)
                          ),
                        ),
                      ),
                    ),
                    // Combined Error Message
                    // if (errorMessage !=
                    // null) // Display combined error message (outside error handling)
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 30.0, vertical: 5.0),
                    //   child: Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       errorMessage!,
                    //       style: const TextStyle(color: Colors.red),
                    //     ),
                    //   ),
                    // ),
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
                          padding: const EdgeInsets.only(right: 30.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Forgot(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 18, 76, 236),
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Color.fromARGB(255, 18, 76, 236),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed:
                          validateForm, // Validate form and handle errors (inside error handling)
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 7, 81),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15), // Padding
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp_Page(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 19, 224),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
