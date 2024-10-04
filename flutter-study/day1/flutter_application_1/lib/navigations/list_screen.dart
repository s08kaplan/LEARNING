import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_list_1.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<bool> _showJobList = [];
  void initState() {
    super.initState();
    _showJobList = List.filled(myList.length, false);
  }

  void _showJob(int index) {
    setState(() {
      _showJobList[index] = !_showJobList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showJob(index),
            child: Column(
              children: [
                ListTile(
                  title: Text(myList[index].name),
                  subtitle:
                      _showJobList[index] ? Text(myList[index].job) : null,
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
