import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final List<Map<String, String>> fields;
  final void Function(Map<String, String>) onSubmit;

  const AuthForm({
    super.key,
    required this.fields,
    required this.onSubmit,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      _controllers[field["name"]!] = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ...widget.fields.map((field) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _controllers[field["name"]],
              decoration: InputDecoration(labelText: field["label"]),
              obscureText: field["type"] == "password",
              keyboardType: field["type"] == "email"
                  ? TextInputType.emailAddress
                  : TextInputType.text,
            ));
      }),
      ElevatedButton(
          onPressed: () {
            Map<String, String> formData = {};
            _controllers.forEach((key, controller) {
              formData[key] = controller.text.trim();
            });
            widget.onSubmit(formData);
          },
          child: const Text("Submit"))
    ]));
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }
}
