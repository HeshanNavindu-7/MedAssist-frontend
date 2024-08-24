import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static const String baseUrl = 'http://192.168.162.192:8000';

  // Send user message to the backend and receive response
  static Future<String> sendMessage(String userMessage) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chat/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': userMessage}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response'];
    } else {
      // Handle error
      throw Exception('Failed to get response: ${response.statusCode}');
    }
  }
}
