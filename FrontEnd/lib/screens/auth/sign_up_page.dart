import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/screens/auth/sign_in_page.dart';
import '../home.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp_Page> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool rememberMe = false;

  Future<void> signUp() async {
    String baseUrl = dotenv.env['API_URL'] ?? '';
    String url = '$baseUrl/sign-up/';

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
        // Successful sign-up; navigate to home page
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else if (response.statusCode == 400) {
        showErrorMessage('Sign up failed. Please check your details.');
      } else {
        showErrorMessage('Sign up failed. Please try again later.');
      }
    } catch (e) {
      showErrorMessage('An error occurred. Please try again.');
    }
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

  void validateForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      signUp();
    } else {
      String? emailError = validateEmail(emailController.text);
      String? passwordError = validatePassword(passwordController.text);
      String? fullNameError = validateFullName(firstNameController.text);
      String? ageError = validateAge(ageController.text);
      String? phoneNumberError = validatePhoneNumber(phoneNumberController.text);
      String? confirmPasswordError = validateConfirmPassword(confirmPasswordController.text);

      if (fullNameError != null) {
        showErrorMessage(fullNameError);
      } else if (ageError != null) {
        showErrorMessage(ageError);
      } else if (emailError != null) {
        showErrorMessage(emailError);
      } else if (phoneNumberError != null) {
        showErrorMessage(phoneNumberError);
      } else if (passwordError != null) {
        showErrorMessage(passwordError);
      } else if (confirmPasswordError != null) {
        showErrorMessage(confirmPasswordError);
      } else {
        showErrorMessage("Please check your email and password.");
      }
      return;
    }
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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
              child: Form(
                key: _formKey,
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
                          // Full Name
                          buildTextField(
                            controller: firstNameController,
                            hintText: 'Full Name',
                            icon: Icons.person,
                            validator: validateFullName,
                          ),
                          // Age
                          buildTextField(
                            controller: ageController,
                            hintText: 'Age',
                            icon: Icons.calendar_month,
                            validator: validateAge,
                            keyboardType: TextInputType.number, 
                          ),
                          // Email Address
                          buildTextField(
                            controller: emailController,
                            hintText: 'E-Mail',
                            icon: Icons.email,
                            validator: validateEmail,
                          ),
                          // Phone Number
                          buildTextField(
                            controller: phoneNumberController,
                            hintText: 'Phone Number',
                            icon: Icons.call,
                            validator: validatePhoneNumber,
                            keyboardType: TextInputType.number, 
                          ),
                          // Password
                          buildTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            icon: Icons.lock,
                            obscureText: true,
                            validator: validatePassword,
                          ),
                          // Confirm Password
                          buildTextField(
                            controller: confirmPasswordController,
                            hintText: 'Confirm Password',
                            icon: Icons.lock,
                            obscureText: true,
                            validator: validateConfirmPassword,
                          ),
                          // Remember Me Checkbox
                          Align(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        rememberMe = value!;
                                      });
                                    },
                                  ),
                                  const Text('Remember Me'),
                                ],
                              ),
                            ),
                          ),
                          // Sign Up Button
                          ElevatedButton(
                            onPressed: () {
                              validateForm();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 0, 7, 81),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        children: [
                          const SizedBox(width: 70),
                          const Text("If you already have an account "),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInPage()),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 19, 224),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text, 
  }) {
    return Align(
      alignment: const Alignment(0, 0.06),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType, 
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(200, 255, 255, 255),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              errorStyle:
                  const TextStyle(height: 0.01, color: Colors.transparent),
              filled: false,
            ),
            style: const TextStyle(color: Colors.white),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
