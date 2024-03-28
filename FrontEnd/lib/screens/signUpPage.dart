import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp_Page> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    String username = usernameController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;

    // Your backend endpoint URL
    String url = 'http://your-backend-url.com/createValue/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Request successful, handle response if needed
        print('Sign up successful');
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
                //Email Address
                Align(
                  alignment: const Alignment(0, 0.06),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
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
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Phone Number',
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
                  onPressed: signUp,
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
