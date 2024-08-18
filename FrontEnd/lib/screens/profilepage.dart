import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:midassist/screens/faqs.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/signUpPage.dart';
import 'package:midassist/screens/myappointments.dart';
import 'package:midassist/screens/mysaved.dart';
import 'package:midassist/screens/profile.dart';
import 'package:midassist/screens/paymentmethod.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;
import '../APIs/userDetails.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      final Map<String, dynamic> data =
          await UserDataManager.fetchUserDetails();
      setState(() {
        userName = data['name'];
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    const String logoutUrl = 'http://192.168.8.135:8000/log-out/';

    try {
      final response = await http.post(Uri.parse(logoutUrl));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final message = responseData['success'];

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUp_Page(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to logout. Please try again.'),
        ));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Wallpaper
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profileback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/profilegirl.png'), // Use an icon if you want to remove this image
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 200,
              left: 50,
              right: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.access_time, size: 30),
                      Text('Age\n24 yrs', textAlign: TextAlign.center),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.height, size: 30),
                      Text('Height\n175cm', textAlign: TextAlign.center),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.line_weight, size: 30),
                      Text('Weight\n103 lbs', textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 330,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MySaved(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.favorite, color: Colors.red),
                      title: Text(
                        'My Saved',
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyAppo(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.blue),
                      title: Text(
                        'Appointments',
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pay(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.payment, color: Colors.green),
                      title: Text(
                        'Payment Method',
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Faq(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.grey),
                      title: Text(
                        'FAQs',
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      _handleLogout(context);
                    },
                    child: const ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 35,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_back, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
