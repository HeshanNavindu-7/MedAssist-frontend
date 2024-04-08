import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Hello, Hesh',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ), //Hello, Hesh code
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Image(
                    image: AssetImage('assets/notification.png'),
                    height: 50,
                  ), //Bell image
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 189, 189, 189)
                        .withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 25,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctor, drugs, articles...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ), //Search box
          ),
          const Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Doctor.png'),
                      height: 100,
                      width: 50,
                    ), //Doctor image
                    Text(
                      'Doctor',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Pharmacy.png'),
                      height: 100,
                      width: 50,
                    ), //Pharmacy image
                    Text(
                      'Pharmacy',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Hospital.png'),
                      height: 100,
                      width: 50,
                    ), //Hospital image
                    Text(
                      'Hospital',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Ambulance.png'),
                      height: 100,
                      width: 50,
                    ), //Ambulance image
                    Text(
                      'Ambulance',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/Learn_more.png'),
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
