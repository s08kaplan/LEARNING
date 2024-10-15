import "dart:convert";
import "package:http/http.dart" as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:project_1/model/user_model.dart";


class UserService {
  final String? baseUrl = dotenv.env["API_BASE_URL"];

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/users"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<dynamic> jsonData = json.decode(response.body)["users"];
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("error status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("failed to fetch users: $error");
    }
  }

  Future<User> getUser(int userId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/users/$userId"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception("error statusCode: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("User not fetched: $error");
    }
  }
}
