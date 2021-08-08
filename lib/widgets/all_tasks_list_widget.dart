import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/apis/tasks_api.dart';
import 'package:todoapp/utilities/color_palette.dart';
import 'package:todoapp/widgets/all_slidable_widget.dart';

class AllTasksList extends StatefulWidget {
  const AllTasksList({Key? key}) : super(key: key);

  @override
  _AllTasksListState createState() => _AllTasksListState();
}

class _AllTasksListState extends State<AllTasksList> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _listStream = FirebaseFirestore.instance
        .collection(getUID())
        .where("completed", isEqualTo: false)
        .limit(7)
        .orderBy("timestamp", descending: false)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _listStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong!"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text("It's null"),
          );
        } else {
          return new ListView(
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                var documentId = document.reference.id;
                print(document.reference.id);
                return new SlidableWidget(
                  // key: Key(data["task"]),
                  onDismissed: (SlidableAction action) {
                    dismissSlidableItem(context, action, documentId);
                  },
                  child: new Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: new ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.rocket,
                        size: 30,
                        color: ColorPalette.neonBlue,
                      ),
                      title: Text(
                        data["task"],
                        style: TextStyle(fontSize: 25),
                      ),
                      subtitle: Text(
                        data["description"],
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: FaIcon(FontAwesomeIcons.angleDoubleLeft,
                            color: Colors.black54),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        }
      },
    );
  }

  void dismissSlidableItem(
      BuildContext context, SlidableAction action, Object documentId) {
    switch (action) {
      case SlidableAction.completed:
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Task has been completed")));
        completeTask(documentId);
        break;
      case SlidableAction.delete:
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Task has been deleted")));
        deleteTask(documentId);
        break;
    }
  }
}
