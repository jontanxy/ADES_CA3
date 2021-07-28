import 'package:flutter/material.dart';
import 'package:todoapp/pages/all_tasks_page.dart';
import 'package:todoapp/pages/done_tasks_page.dart';
import 'package:todoapp/pages/settings_page.dart';
import 'package:todoapp/utilities/color_palette.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// For authentication
import 'package:provider/provider.dart';
import 'package:todoapp/providers/google_sign_in.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageNavigator(),
    );
  }
}

class PageNavigator extends StatefulWidget {
  PageNavigator({Key? key}) : super(key: key);

  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int currentIndex = 0;

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
      title: Padding(
        padding: EdgeInsets.only(left: 20.5),
        child: Text(
          "To Do App",
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontFamily: 'Roboto'),
        ),
      ),
      titleSpacing: 0,
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: Icon(Icons.menu),
      // ),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.notifications_none),
        // ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        TextButton(
          child: Text("Log Out"),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogout();
          },
        ),
      ],
      // centerTitle: true,
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
        return DoneTasksPage();
      case 2:
        return SettingsPage();
      case 0:
      default:
        return AllTasksPage();
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
        // BottomNavyBarItem(
        //     icon: Icon(Icons.today_rounded),
        //     title: Text("Today"),
        //     activeColor: ColorPalette.delugePurple,
        //     inactiveColor: Colors.black,
        //     textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.fact_check_outlined),
            title: Text("Tasks"),
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
