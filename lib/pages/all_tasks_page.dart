import 'package:flutter/material.dart';
import 'package:todoapp/widgets/add_todos_btn.dart';
import 'package:todoapp/widgets/all_tasks_list_widget.dart';

class AllTasksPage extends StatefulWidget {
  AllTasksPage({Key? key}) : super(key: key);

  @override
  _AllTasksPage createState() => _AllTasksPage();
}

class _AllTasksPage extends State<AllTasksPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: AddToDoBtn(),
        body: AllTasksList(),
      );
}
