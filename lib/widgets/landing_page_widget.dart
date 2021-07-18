import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/google_sign_in.dart';

class LandingPageWidget extends StatelessWidget {
  LandingPageWidget({Key? key}) : super(key: key);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text("Log Out"),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
            },
          ),
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Name: " + user.displayName!,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Email: " + user.email!,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Uid: " + user.uid,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
