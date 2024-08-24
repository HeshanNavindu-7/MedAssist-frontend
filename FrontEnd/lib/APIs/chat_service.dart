import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static const String _baseUrl = 'http://192.168.1.2:8000';

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/chat/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'message': message,
        'user': 'some_username', // Include the user field
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['response'];
    } else {
      throw Exception('Failed to get a response from the server');
    }
  }
}
