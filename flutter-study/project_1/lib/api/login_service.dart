import "dart:convert";
import "package:http/http.dart" as http;
import "package:project_1/model/login_model.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';



class LoginService {
  final String? baseUrl = dotenv.env["API_BASE_URL"];

  Future<LoginModel> login(
      String username, String email, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");

    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
            {"username": username, "email": email, "password": password}));
            
            if(response.statusCode >= 200 && response.statusCode < 300){
              final jsonResponse = json.decode(response.body);
              return LoginModel.fromJson(jsonResponse);
            }else {
              throw Exception("Failed to login: ${response.statusCode}");
            }
  }
}
