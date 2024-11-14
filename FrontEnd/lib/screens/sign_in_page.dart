// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/sign_up_page.dart';
import 'package:midassist/screens/forgotpassword.dart';
import 'home.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  Future<void> signIn() async {
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
        // final responseData = jsonDecode(response.body);
        // final userId = responseData['user_id'];
        // print('User ID: $userId');
        // print('Sign in successful');
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        showErrorMessage(
            'Sign in failed. Please check your email and password.');
      }
    } catch (e) {
      showErrorMessage('An error occurred. Please try again.');
    }
  }

  void validateForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      setState(() {
        _isEmailValid = true;
        _isPasswordValid = true;
      });
      signIn();
    } else {
      String? emailError = validateEmail(usernameController.text);
      String? passwordError = validatePassword(passwordController.text);

      if (emailError != null) {
        setState(() {
          _isEmailValid = false;
        });
        showErrorMessage(emailError);
      } else if (passwordError != null) {
        setState(() {
          _isPasswordValid = false;
        });
        showErrorMessage(passwordError);
      } else {
        showErrorMessage("Please check your email and password.");
      }
      return;
    }
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@')) {
      return 'Email must contain "@"';
    } else if (!value.contains('.')) {
      return 'Email must contain a "." after "@"';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Enter a valid email address, e.g., name@example.com';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(seconds: 5),
      ),
    );
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
                                  const Icon(Icons.email, color: Colors.white),
                              hintText: 'User Email',
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(200, 255, 255, 255),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? Colors.white
                                      : Colors
                                          .red, // Border color based on validation
                                ),
                              ),
                              filled: false,
                              errorStyle: const TextStyle(height: 0.01,color: Colors.transparent),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            validator: (value) => validateEmail(value!),
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
                                borderSide: BorderSide(
                                  color: _isPasswordValid
                                      ? Colors.white
                                      : Colors
                                          .red, // Border color based on validation
                                ),
                              ),
                              filled: false,
                              errorStyle: const TextStyle(height: 0.01,color: Colors.transparent),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) => validatePassword(value!),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
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
                      onPressed: validateForm,
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
