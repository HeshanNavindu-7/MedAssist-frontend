import 'package:flutter/material.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/widgets/custom_bottom_navigation_bar.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Desk'),
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          // Background image or container

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Introduction text
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "We're here to help with anything and \neverything on MedAssist.",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: _isFocused
                            ? ''
                            : 'Search doctor, drugs, articles...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // FAQ Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'At Viral Pitch we expect at a day’s start is you, \n'
                          'better and happier than yesterday. We have got \n'
                          'you covered share your concern or check our \n'
                          'frequently asked questions listed below.\n',
                          style: TextStyle(fontSize: 14.0, height: 1.5),
                        ),
                        Text(
                          'FAQ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        FaqItem(
                          question: 'What is MedAssist?',
                          answer:
                              'MedAssist is a comprehensive platform designed to help you manage your health effectively. It includes features such as tracking medications, booking appointments, and accessing medical resources.',
                        ),
                        SizedBox(height: 15),
                        FaqItem(
                          question:
                              'How to apply MedAssist to day-to-day life?',
                          answer:
                              'You can use MedAssist by integrating it into your daily routine to keep track of your health needs, set reminders for medications, and access health-related information.',
                        ),
                        SizedBox(height: 15),
                        FaqItem(
                          question: 'Is it safe to use MedAssist?',
                          answer:
                              'Yes, MedAssist is designed with privacy and security in mind. Your data is protected and encrypted to ensure your information remains confidential.',
                        ),
                        SizedBox(height: 15),
                        FaqItem(
                          question: 'What is the accuracy of MedAssist?',
                          answer:
                              'MedAssist utilizes advanced algorithms and data to provide accurate information and recommendations. However, always consult with a healthcare professional for medical advice.',
                        ),
                        SizedBox(height: 15),
                        FaqItem(
                          question: 'How to support MedAssist?',
                          answer:
                              'You can support MedAssist by providing feedback, sharing the platform with others, and participating in community forums to help improve the service.',
                        ),
                      ],
                    ),
                  ),
                  // Help mail text and button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        const Text(
                          'Still stuck? Help is a mail away.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            // Handle the 'Send a message' action here
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 7, 81),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: Color.fromARGB(255, 0, 7, 81)),
                            ),
                            child: const Center(
                              child: Text(
                                'Send a message',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqItem({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(widget.answer),
              ),
          ],
        ),
      ),
    );
  }
}
