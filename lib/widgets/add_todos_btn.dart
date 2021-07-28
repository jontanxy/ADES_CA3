import 'package:flutter/material.dart';
import 'package:todoapp/apis/tasks_api.dart';
import 'package:todoapp/utilities/color_palette.dart';

class AddToDoBtn extends StatelessWidget {
  const AddToDoBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String input = "";

    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: ColorPalette.scienceBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text("Add Task"),
              content: TextField(
                onChanged: (String value) {
                  input = value;
                },
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await addTask(input);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                )
              ],
            );
          },
        );
      },
    );
  }
}
