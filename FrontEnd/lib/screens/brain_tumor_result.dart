import 'package:flutter/material.dart';

class Brain_Tumor_result extends StatelessWidget {
  final String imageData;
  final String predictedClass;

  const Brain_Tumor_result({
    super.key,
    required this.imageData,
    required this.predictedClass,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text("Image Analysis Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageData),
            const SizedBox(height: 16.0),
            Text(
              'Predicted Class: $predictedClass',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
