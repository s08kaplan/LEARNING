import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigations",
        style: TextStyle(fontWeight: FontWeight.w600, color:Colors.white),
        ),
        backgroundColor: Colors.blue.shade100,
        centerTitle: true
      ),
      body: const Center(child: Column(
        children: [],
      ),)
    );
  }
}