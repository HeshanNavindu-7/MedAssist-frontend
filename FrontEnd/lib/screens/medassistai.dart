import 'package:flutter/material.dart';
import 'package:midassist/screens/home.dart';

class MedAssistAi extends StatefulWidget {
  const MedAssistAi({Key? key}) : super(key: key);

  @override
  _MedAssistAiState createState() => _MedAssistAiState();
}

class _MedAssistAiState extends State<MedAssistAi> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages
        .add({'text': "Hello, I'm Medi. How can I help you?", 'sender': 'bot'});
  }

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.insert(0, {'text': _controller.text, 'sender': 'user'});
      _controller.clear();
    });

    // Simulating a response from the chat bot
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.insert(
            0, {'text': 'This is a response from the bot.', 'sender': 'bot'});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text('MedAssist AI'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Chat messages
          Positioned(
            top: 0,
            bottom: 100,
            left: 20,
            right: 20,
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        message['text']!,
                        style: TextStyle(
                          color: message['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Positioned(
            top: 150,
            left: 70,
            child: Column(
              children: [
                //skin image
                Image(image: AssetImage('assets/skin.png')),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    //text
                    "We've analyzed your unique skin profile \nusing advanced AI algorithms and facial \nrecognition technology. Based on our \nassessment, we're thrilled to present your \npersonalized skincare routine tailored \njust for you!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 470,
            left: 140,
            child: Image(image: AssetImage('assets/morning.png')),
          ),
          const Positioned(
            top: 550,
            left: 20,
            child: Text(
              '1. Gentle Cleanser: Start your day with [Brand Name]s\n hydrating cleanser to cleanse and refresh your skin \n without stripping away natural oils.',
              textAlign: TextAlign.start,
            ),
          ),
          const Positioned(
            top: 610,
            left: 20,
            child: Text(
              '2. Vitamin C Serum: Apply a few drops of [Brand Name]s\n Vitamin C serum. It helps brighten your complexion,\n reduce dark spots, and protect your skin from\n environmental stressors.',
              textAlign: TextAlign.start,
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image(
              image: AssetImage('assets/Bottom_rectangle.png'),
            ),
          ),
          //add image
          const Positioned(
            bottom: 25,
            left: 20,
            child: Image(image: AssetImage('assets/Add.png')),
          ),
          //chat box
          Positioned(
            bottom: 10,
            left: 20,
            right: 70,
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: 'Start typing here to chat...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          // Send button
          Positioned(
            bottom: 15,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.send),
              color: Colors.blue,
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
