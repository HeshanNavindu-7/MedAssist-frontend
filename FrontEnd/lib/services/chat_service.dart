import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static  String _baseUrl = dotenv.env['API_URL'] ?? '';
  static const int _userId =3; 

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/chat/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'message': message,
        'user': _userId,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['answer'];
    } else {
      throw Exception('Failed to get a response from the server');
    }
  }
}
