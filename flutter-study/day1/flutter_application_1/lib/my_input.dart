import 'package:flutter/material.dart';

// List of form fields (Dynamic form data)
final List<Map<String, dynamic>> formFields = [
  {
    'label': 'First Name',
    'placeholder': 'Enter your first name',
    'type': TextInputType.text,
  },
  {
    'label': 'Email',
    'placeholder': 'Enter your email',
    'type': TextInputType.emailAddress,
  },
  {
    'label': 'Phone Number',
    'placeholder': 'Enter your phone number',
    'type': TextInputType.phone,
  },
];

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  // To store form values dynamically
  Map<String, String> formValues = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Dynamic Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: formFields.length,
          itemBuilder: (context, index) {
            var field = formFields[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                keyboardType: field['type'],
                decoration: InputDecoration(
                  labelText: field['label'],
                  hintText: field['placeholder'],
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    
                    formValues[field['label']] = value;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyFormWidget()));
}
