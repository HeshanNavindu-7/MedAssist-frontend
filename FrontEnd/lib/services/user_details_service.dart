import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserDataManager {
  static Future<Map<String, dynamic>> fetchUserDetails() async {
    String baseUrl = dotenv.env['API_URL'] ?? ''; 
    final response =
        await http.get(Uri.parse('$baseUrl/users/'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user details: ${response.statusCode}');
    }
  }
}
