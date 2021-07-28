import 'package:flutter/material.dart';
import 'package:todoapp/widgets/add_todos_btn.dart';
import 'package:todoapp/widgets/done_tasks_list_widget.dart';

class DoneTasksPage extends StatefulWidget {
  DoneTasksPage({Key? key}) : super(key: key);

  @override
  _DoneTasksPageState createState() => _DoneTasksPageState();
}

class _DoneTasksPageState extends State<DoneTasksPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: AddToDoBtn(),
        body: DoneTasks(),
      );
}
