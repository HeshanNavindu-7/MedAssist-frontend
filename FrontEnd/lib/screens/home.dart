import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(children: [
        Padding(
          padding: EdgeInsets.all(50),
          child: Text(
            'Hello, Hesh',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Image(
          image: AssetImage('assets/notification.png'),
          height: 150,
        ),
      ]),
    );
  }
}
