import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "checkout",
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 255, 235),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 1.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Color.fromARGB(255, 202, 202, 202),
                      size: 60,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0,left: 20),
                child: Text(
                  "Delivery",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 24, 237, 92),
        ),
      ),
    );
  }
}

void main() {
  runApp(const Checkout());
}
