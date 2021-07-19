import 'package:flutter/material.dart';

class DoneTasksPage extends StatefulWidget {
  DoneTasksPage({Key? key}) : super(key: key);

  @override
  _DoneTasksPageState createState() => _DoneTasksPageState();
}

class _DoneTasksPageState extends State<DoneTasksPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            "Done Tasks",
            style: TextStyle(fontSize: 50),
          ),
        ),
      );
}
