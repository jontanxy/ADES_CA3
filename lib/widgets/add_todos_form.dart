import 'package:flutter/material.dart';
import 'package:todoapp/apis/tasks_api.dart';

class ToDoForm extends StatefulWidget {
  ToDoForm({Key? key}) : super(key: key);

  @override
  _ToDoFormState createState() => _ToDoFormState();
}

class _ToDoFormState extends State<ToDoForm> {
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text("Add Task"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: title,
              validator: (value1) {
                return value1!.isNotEmpty ? null : "Invalid Field";
              },
              onChanged: (String value) {
                title = value;
              },
              decoration: InputDecoration(hintText: "Title of Task"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: description,
              validator: (value2) {
                return value2!.isNotEmpty ? null : "Invalid Field";
              },
              onChanged: (String value) {
                description = value;
              },
              decoration: InputDecoration(hintText: "Description of Task"),
            )
          ],
        ),
      ),
      // content: TextField(
      //   onChanged: (String value) {
      //     input = value;
      //   },
      // ),
      actions: [
        TextButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await addTask(title, description);
              Navigator.of(context).pop();
            }
          },
          child: Text("Add"),
        )
      ],
    );
  }
}
