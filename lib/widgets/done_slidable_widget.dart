import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/utilities/color_palette.dart';

enum SlidableAction { completed, delete }

class SlidableWidget extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget(
      {Key? key, required this.child, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,
        actionExtentRatio: 0.2,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: "Undo",
            color: ColorPalette.facebookBlue,
            icon: Icons.undo,
            onTap: () => onDismissed(SlidableAction.completed),
          ),
          IconSlideAction(
            caption: "Delete",
            color: ColorPalette.dangerRed,
            icon: Icons.delete_forever,
            onTap: () => onDismissed(SlidableAction.delete),
          ),
        ],
      );
}
