import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:midassist/screens/appointmentdetails.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';
import 'package:midassist/screens/myappointments.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  DateTime _selectedDate = DateTime.now();

  // Function to select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to get the day string from a date
  String _getDayString(DateTime date) {
    return "${date.day} ${date.month}";
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the dates to display
    DateTime day1 = _selectedDate.subtract(const Duration(days: 1));
    DateTime day2 = _selectedDate;
    DateTime day3 = _selectedDate.add(const Duration(days: 1));
    DateTime day4 = _selectedDate.add(const Duration(days: 2));

    return Scaffold(
      body: Container(
        // Background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/appoinmentback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Navigation bar
            Positioned(
              top: 728,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
            // New appointment
            Positioned(
              top: 10,
              right: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyAppo(),
                          ),
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/back.png'),
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Text(
                      'New Appointment',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // Date picker
            Positioned(
              top: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('${_selectedDate.month}, ${_selectedDate.year}'),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: const Image(
                          image: AssetImage('assets/downarrow.png')),
                    ),
                  ],
                ),
              ),
            ),
            // Days buttons
            Positioned(
              top: 100,
              left: 15,
              child: Row(
                children: [
                  _buildDayButton(day1, day1 == _selectedDate),
                  _buildDayButton(day2, day2 == _selectedDate),
                  _buildDayButton(day3, day3 == _selectedDate),
                  _buildDayButton(day4, day4 == _selectedDate),
                ],
              ),
            ),
            // The rest of your UI
            const Positioned(
                // available time
                top: 195,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Available Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            const Positioned(
                top: 220,
                left: 30,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/9am.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/930am.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/10am.png'),
                      ),
                    )
                  ],
                )),
            const Positioned(
                // patient details
                top: 265,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Patient Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            const Positioned(
                // full name
                top: 285,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Full Name'),
                )),
            Positioned(
              top: 315,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // Age
            const Positioned(
                top: 370,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Age'),
                )),
            Positioned(
              top: 400,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your age',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const Positioned(
                // gender
                top: 460,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Gender'),
                )),
            const Positioned(
              top: 485,
              left: 75,
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/male.png'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Image(
                    image: AssetImage('assets/female.png'),
                  ),
                ],
              ),
            ),
            const Positioned(
                // problem
                top: 515,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Problem'),
                )),
            Positioned(
              top: 545,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write your problem in detail',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const Positioned(
              // book appointment
              top: 640,
              left: 15,
              child: Image(
                image: AssetImage('assets/appointment.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build a day button widget
  Widget _buildDayButton(DateTime date, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          _getDayString(date),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
