import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static const String _baseUrl = 'http://192.168.1.2:8000';
  static const int _userId =
      3; // Hard-coded user ID need to pass user id  loged user

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/chat/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'message': message,
        'user': _userId, // Pass the hard-coded user ID
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['answer']; // Adjust key as needed
    } else {
      throw Exception('Failed to get a response from the server');
    }
  }
}
