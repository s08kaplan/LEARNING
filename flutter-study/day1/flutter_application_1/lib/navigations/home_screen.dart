import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigations/about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Navigations",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            backgroundColor: Colors.blue.shade100,
            centerTitle: true),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ));
                  },
                  child:const Text("About"))
            ],
          ),
        ));
  }
}
