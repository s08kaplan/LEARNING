import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}