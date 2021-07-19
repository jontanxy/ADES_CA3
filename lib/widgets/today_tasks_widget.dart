import 'package:flutter/material.dart';

class TodayTasksPage extends StatefulWidget {
  TodayTasksPage({Key? key}) : super(key: key);

  @override
  _TodayTasksPageState createState() => _TodayTasksPageState();
}

class _TodayTasksPageState extends State<TodayTasksPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            "Today's Tasks",
            style: TextStyle(fontSize: 50),
          ),
        ),
      );
}
