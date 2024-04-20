import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../APIs/userDetails.dart';

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
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      final Map<String, dynamic> data = await UserDataManager.fetchUserDetails();
      setState(() {
        userEmail = data['email'];
        userName = data['name'];
        userAge = data['age'];
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
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
