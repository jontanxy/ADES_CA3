import 'package:flutter/material.dart';

class AllTasksPage extends StatefulWidget {
  AllTasksPage({Key? key}) : super(key: key);

  @override
  _AllTasksPageState createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            "All Tasks",
            style: TextStyle(fontSize: 50),
          ),
        ),
      );
}
