import 'package:flutter/material.dart';
import 'package:todoapp/utilities/color_palette.dart';
import 'package:todoapp/widgets/add_todos_form.dart';

class AddToDoBtn extends StatelessWidget {
  const AddToDoBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: ColorPalette.scienceBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => ToDoForm(),
        );
      },
    );
  }
}
