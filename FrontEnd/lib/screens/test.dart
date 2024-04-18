import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String? userEmail;
  String? userName;
  int? userAge;

  @override
  void initState() {
    super.initState();
    // Fetch user details when the widget is initialized
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    final response =
    await http.get(Uri.parse('http://10.0.2.2:8000/users/'));

    if (response.statusCode == 200) {
      // Parse the response JSON
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userEmail = data['email'];
        userName = data['name'];
        userAge = data['age'];
      });
    } else {
      // Handle error
      print('Failed to fetch user details: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userEmail != null)
              Text('Email: $userEmail'),
            if (userName != null)
              Text('Name: $userName'),
            if (userAge != null)
              Text('Age: $userAge'),
          ],
        ),
      ),
    );
  }
}
