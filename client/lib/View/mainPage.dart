// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:myplanner_nodeapp/View/schedule.dart';
import 'package:myplanner_nodeapp/View/profile.dart';
import 'package:myplanner_nodeapp/View/reminder.dart';
import 'package:myplanner_nodeapp/View/schedulePage.dart';
import 'package:myplanner_nodeapp/View/skills.dart';

import 'landingPage.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int index = 0;
  final screens = [
    landingPage(),
    schedule(),
    // reminderPage(),
    // skillsPage(),
    // profilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: screens[index],
          bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                  indicatorColor: Color.fromARGB(255, 195, 213, 248),
                  labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  )),
              child: NavigationBar(
                  height: 80,
                  backgroundColor: Color.fromARGB(255, 237, 237, 239),
                  selectedIndex: index,
                  onDestinationSelected: (index) =>
                      setState(() => this.index = index),
                  destinations: [
                    NavigationDestination(
                        icon: Image.asset(
                          "lib/assets/home.png",
                          height: 40,
                        ),
                        label: 'Home'),
                    NavigationDestination(
                        icon: Image.asset(
                          "lib/assets/calendar.png",
                          height: 40,
                        ),
                        label: 'Schedule'),
                    // NavigationDestination(
                    //     icon: Image.asset(
                    //       "lib/assets/bell.png",
                    //       height: 40,
                    //     ),
                    //     label: 'Reminder'),
                    // NavigationDestination(
                    //     icon: Image.asset(
                    //       "lib/assets/skill.png",
                    //       height: 40,
                    //     ),
                    //     label: 'Skills'),
                    // NavigationDestination(
                    //     icon: Image.asset(
                    //       "lib/assets/user.png",
                    //       height: 40,
                    //     ),
                    //     label: 'Profile'),
                  ])),
          appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/space.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leadingWidth: 100,
              title: Text("Home"),
              leading: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
                label: const Text(
                  "Go Back",
                ),
              )),
          // body: landingPage(),
        ));
  }
}
