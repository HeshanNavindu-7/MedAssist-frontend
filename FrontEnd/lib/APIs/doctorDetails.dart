import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorDataManager {
  static Future<List<dynamic>> fetchDoctorDetails() async {
    final response =
        await http.get(Uri.parse('http://192.168.8.135:8000/doctors/'));

    if (response.statusCode == 200) {
      // Parse the response JSON
      return jsonDecode(response.body);
    } else {
      // Handle error
      throw Exception('Failed to fetch doctor details: ${response.statusCode}');
    }
  }
}
