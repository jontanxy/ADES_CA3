import 'package:flutter/material.dart';
// import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:todoapp/screens/all_tasks_page.dart';
import 'package:todoapp/screens/done_tasks_page.dart';
import 'package:todoapp/screens/settings_page.dart';
import 'package:todoapp/screens/today_tasks_page.dart';
import 'package:todoapp/utilities/color_palette.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// For authentication
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp/providers/google_sign_in.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageNavigator(),
    );
  }

  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // @override
  // Widget build(BuildContext context) {
  //   final user = FirebaseAuth.instance.currentUser!;

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Logged In"),
  //       centerTitle: true,
  //       actions: [
  //         TextButton(
  //           child: Text("Log Out"),
  //           onPressed: () {
  //             final provider =
  //                 Provider.of<GoogleSignInProvider>(context, listen: false);
  //             provider.googleLogout();
  //           },
  //         ),
  //       ],
  //     ),
  //     body: Container(
  //         alignment: Alignment.center,
  //         color: Colors.blueGrey.shade900,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               "Profile",
  //               style: TextStyle(fontSize: 20),
  //             ),
  //             SizedBox(
  //               height: 32,
  //             ),
  //             CircleAvatar(
  //               radius: 40,
  //               backgroundImage: NetworkImage(user.photoURL!),
  //             ),
  //             SizedBox(
  //               height: 8,
  //             ),
  //             Text(
  //               "Name: " + user.displayName!,
  //               style: TextStyle(fontSize: 16, color: Colors.white),
  //             ),
  //             Text(
  //               "Email: " + user.email!,
  //               style: TextStyle(fontSize: 16, color: Colors.white),
  //             ),
  //             Text(
  //               "Uid: " + user.uid,
  //               style: TextStyle(fontSize: 16, color: Colors.white),
  //             ),
  //           ],
  //         )),
  //   );
  // }
}

class PageNavigator extends StatefulWidget {
  PageNavigator({Key? key}) : super(key: key);

  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int currentIndex = 0;

  List listOfPages = [
    Container(color: Colors.white),
    Container(color: ColorPalette.scienceBlue),
    Container(color: ColorPalette.lightBrown),
    Container(color: ColorPalette.neonBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigation(),
      body: pagesNavigation(),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  PreferredSizeWidget topNavigation() {
    return AppBar(
      title: Text(
        "ToDo App",
        style:
            TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Roboto'),
      ),
      centerTitle: true,
      backgroundColor: ColorPalette.wisteriaPurple,
    );
    // actions: [
    //   TextButton(
    //     child: Text("Log Out"),
    //     onPressed: () {
    //       final provider =
    //           Provider.of<GoogleSignInProvider>(context, listen: false);
    //       provider.googleLogout();
    //     },
    //   ),
    // ],
  }

  Widget pagesNavigation() {
    switch (currentIndex) {
      case 1:
        return AllTasksPage();
      case 2:
        return DoneTasksPage();
      case 3:
        return SettingsPage();
      case 0:
      default:
        return TodayTasksPage();
    }
  }

  Widget bottomNavigation() {
    return BottomNavyBar(
      showElevation: true,
      animationDuration: Duration(milliseconds: 250),
      curve: Curves.easeOutSine,
      selectedIndex: currentIndex,
      onItemSelected: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.today_rounded),
            title: Text("Today"),
            activeColor: ColorPalette.delugePurple,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.all_inbox_rounded),
            title: Text("All Tasks"),
            activeColor: ColorPalette.delugePurple,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.done_all_rounded),
            title: Text("Completed"),
            activeColor: ColorPalette.delugePurple,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            activeColor: ColorPalette.delugePurple,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center),
      ],
    );
  }
}
