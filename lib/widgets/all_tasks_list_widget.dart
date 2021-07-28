import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/apis/tasks_api.dart';
import 'package:todoapp/utilities/color_palette.dart';

class AllTasksList extends StatelessWidget {
  const AllTasksList({Key? key}) : super(key: key);

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
                print(document.reference.id);
                return new Dismissible(
                  background: Container(
                    color: ColorPalette.wisteriaPurple,
                    child: Icon(Icons.check),
                  ),
                  key: Key(data["task"]),
                  child: new Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: new ListTile(
                      title: Text(data["task"]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          completeTask(document.reference.id);
                        },
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
}
