import 'package:flutter/material.dart';
import 'package:midassist/APIs/chat_service.dart';
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

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.insert(0, {'text': _controller.text, 'sender': 'user'});
      _controller.clear();
    });

    try {
      final botResponse = await ChatService.sendMessage(_messages[0]['text']!);
      setState(() {
        _messages.insert(0, {'text': botResponse, 'sender': 'bot'});
      });
    } catch (e) {
      setState(() {
        _messages.insert(0, {'text': 'Error: $e', 'sender': 'bot'});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text('Medi Chat'),
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
