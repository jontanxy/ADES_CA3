import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

getUID() {
  // Get UID
  final user = (FirebaseAuth.instance.currentUser!);
  final uid = user.uid;
  return uid;
}

Future addTask(input) async {
  // Set as incompleted
  bool isDone = false;

  CollectionReference toDoLists = db.collection(getUID());
  // Call the user's CollectionReference to add a new user
  return await toDoLists
      .add({
        "task": input,
        "timestamp": DateTime.now(),
        "completed": isDone,
      })
      .then((value) => print("Task Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future completeTask(documentId) async {
  // Set as completed
  bool isDone = true;

  CollectionReference toDoLists = db.collection(getUID());
  // onPressed? Yes.
  return await toDoLists
      .doc(documentId)
      .update({'completed': isDone})
      .then((value) => print("Task Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future deleteTask(documentId) async {
  CollectionReference toDoLists = db.collection(getUID());
  // onPressed?
  return await toDoLists
      .doc(documentId)
      .delete()
      .then((value) => print("Task Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
