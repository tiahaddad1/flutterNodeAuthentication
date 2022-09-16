// import 'dart:html';

import 'package:flutter/material.dart';
import 'welcome.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          new Container(
              alignment: Alignment.center,
              child: Image.asset(
                "lib/assets/logo.webp",
                width: 200,
                height: 300,
              )),
          new Container(
            alignment: Alignment.center,
            child: Text(
              "myPlanner",
              style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  fontFamily: 'Righteous-Regular'),
            ),
            padding: EdgeInsets.only(bottom: 70),
          ),
          new TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => welcomePage()));
              },
              child: Text(
                "Start Planning!",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue))))),
        ]));
  }
}
