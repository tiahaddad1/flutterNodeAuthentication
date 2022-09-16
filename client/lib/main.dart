import 'dart:convert';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'dart:html';
import 'View/mainScreen.dart';
import 'package:http/http.dart' as http;
import 'Model/User.dart';

Future<User> fetchData() async {
  final res = await http.get(Uri.parse("http://localhost:3001/")
      // headers: {"Content-Type": "application/json"}, /*body:json.encode({})*/
      );
  return User.fromJson(jsonDecode(res.body));
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late Future<User> user;
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    user = fetchData();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Text(snapshot.data!.getName());
              return mainScreen();
            } else if (snapshot.hasError) {
              print(snapshot);
              // return mainScreen();
              return Container(
                  color: Colors.white,
                  alignment: Alignment.bottomCenter,
                  child: Column(children: [
                    Image.asset(
                      "lib/assets/issue.png",
                      width: 100,
                      height: 200,
                    ),
                    Padding(
                        padding: EdgeInsets.all(60),
                        child: Text(
                          "An issue has occured, please try to open the app later.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 171, 31, 21),
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ]));
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));

    //return MaterialApp(debugShowCheckedModeBanner: false, home: mainScreen());
  }
}
