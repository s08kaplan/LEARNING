import "package:flutter/material.dart";
import "package:project_1/api/login_service.dart";
import "package:project_1/custom_widgets/auth_form.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _submitLogin(Map<String, String> formData) {
  print("post data in login: $formData");

    LoginService().login(
      formData["username"] ?? "", 
      formData["email"] ?? "", 
      formData["password"] ?? ""
    );
}


  @override
  Widget build(BuildContext context) {
    final loginFields = [
      {'name': 'username', 'label': 'Username', 'type': 'text'},
      {'name': 'email', 'label': 'Email', 'type': 'email'},
      {'name': 'password', 'label': 'Password', 'type': 'password'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: AuthForm(fields: loginFields, onSubmit: _submitLogin)
      )
    );
  }
}