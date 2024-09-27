import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_input.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Flutter", textAlign: TextAlign.center)
      ),
        body: const Column(
          children: [
            Text("Please Login"),
            MyFormWidget(),
          ],
        )
    );
  }
}