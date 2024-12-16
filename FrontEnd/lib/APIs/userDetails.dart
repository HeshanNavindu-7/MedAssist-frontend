import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDataManager {
  static Future<Map<String, dynamic>> fetchUserDetails() async {
    final response =
        await http.get(Uri.parse('http://192.168.8.172:8000/users/'));

    if (response.statusCode == 200) {
      // Parse the response JSON
      return jsonDecode(response.body);
    } else {
      // Handle error
      throw Exception('Failed to fetch user details: ${response.statusCode}');
    }
  }
}
