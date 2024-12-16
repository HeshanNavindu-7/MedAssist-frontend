import 'dart:async';
import 'package:flutter/material.dart';
import 'package:midassist/screens/onboarding/splash_screen.dart';
import 'package:midassist/screens/forgotpassword.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTP> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  late Timer _timer;
  int _remainingTime = 120; // 2 minutes in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void _onOtpEntered() {
    String otpCode = _controllers.map((controller) => controller.text).join();
    print("Entered OTP: $otpCode");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              _focusNodes[index].unfocus();
              _onOtpEntered();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  void _resendCode() {
    setState(() {
      _remainingTime = 120;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String getTimerText() {
      final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
      final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/Forgotpw/otp.jpg', // Add a relevant image here
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'OTP Verification',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please check your email to see the verification code',
                    style: TextStyle(color: Color.fromARGB(255, 116, 116, 115)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return _buildOtpBox(index);
                    }),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onOtpEntered,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 0, 7, 81), // Updated button color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Verify Me',
                        style: TextStyle(
                          color: Colors.white, // Set text color to white
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _remainingTime > 0
                        ? 'Resend code in ${getTimerText()}'
                        : 'Didn\'t receive the code?',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  if (_remainingTime == 0)
                    TextButton(
                      onPressed: _resendCode,
                      child: const Text('Resend Code'),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: OTP(),
  ));
}
