import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigations/List_Screen.dart';
import 'package:flutter_application_1/navigations/home_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text("Gallery screen"),
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text("Go About")),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }, child:const Text("Go Home")),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen()));
          }, child: const Text("worker list"))],
        ),
      ),
    );
  }
}
