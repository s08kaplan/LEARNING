import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigations/deneme_screen.dart';
import 'package:flutter_application_1/navigations/gallery_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _counter = 0;
  int _counter1 = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterByFive() {
    setState(() {
      _counter1 += 5;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _counter1 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _incrementCounter, child: Text('$_counter')),
        ElevatedButton(
            onPressed: _incrementCounterByFive, child: Text('$_counter1')),
        TextButton(onPressed: _resetCounter, child: const Text('Reset all')),
        const Text("About screen"),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Home")),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GalleryScreen()));
            },
            child: const Text("Go Gallery")),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DenemeScreen()));
            },
            child: const Text("denemeye git"))
      ]),
    ));
  }
}
