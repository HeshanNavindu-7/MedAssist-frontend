import 'package:flutter/material.dart';
import 'package:midassist/widgets/custom_bottom_navigation_bar.dart';

class Pdf_Result extends StatelessWidget {
  final String? responseData;

  Pdf_Result({Key? key, this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        centerTitle: true,
        title: Text('PDF Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PDF Result',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                responseData ?? 'No response data available',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
