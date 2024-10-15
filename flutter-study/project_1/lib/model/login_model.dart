import 'package:project_1/model/user_model.dart';

class LoginModel {
  final String token;
  final User user;

  LoginModel({
    required this.token,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(token: json["token"], user: User.fromJson(json["user"]));
  }
  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "user": user.toJson(),
    };
  }
}