import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../APIs/doctorDetails.dart';
import 'aboutdoctor.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String? userName;
  String? doctorName;

  @override
  void initState() {
    super.initState();
    _fetchDoctorDetails();
  }

  Future<void> _fetchDoctorDetails() async {
    try {
      final List<dynamic> data = await DoctorDataManager.fetchDoctorDetails();

      if (data.isNotEmpty) {
        setState(() {
          // Extract all doctor names from the data list
          List<String> doctorNames = [];
          for (var doctor in data) {
            String name = doctor['name'] ?? 'Unknown'; // Fetch doctor name
            doctorNames.add(name);
          }
          // Set the doctorNames list to the state
          doctorNames = doctorNames;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DoctorDataManager.fetchDoctorDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.data != null) {
            List<dynamic> doctorData = snapshot.data as List<dynamic>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: doctorData.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> doctor = doctorData[index];
                return buildDoctorCard(doctor);
              },
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  Widget buildDoctorCard(Map<String, dynamic> doctor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutDoctor(),
                ),
              );
            },
            child: const Image(
              image: AssetImage('assets/Doctor1.png'),
              height: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              '$doctorName',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.only(top: 0, bottom: 5),
            child: Text(
              'Cardiologist',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/Rating.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/Location.png'),
                ),
              ),
              Text(
                '800m away',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
