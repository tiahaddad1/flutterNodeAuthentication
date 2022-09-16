import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myplanner_nodeapp/View/mainPage.dart';
import 'homePage.dart';
import 'package:http/http.dart' as http;

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  State<logIn> createState() => _logInState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _logInState extends State<logIn> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              automaticallyImplyLeading: false,
              leadingWidth: 100,
              title: Text("Login"),
              leading: ElevatedButton.icon(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
                label: const Text("Go Back"),
              )),
          body: logInDetails(),
        ));
  }
}

class logInDetails extends StatelessWidget {
  const logInDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Align(
        alignment: Alignment.center,
        child: Form(
            key: _formKey,
            child: Column(children: [
              Container(
                child: Image.asset(
                  "lib/assets/signUpimage.webp",
                  width: 400,
                  height: 300,
                ),
              ),
              Padding(
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cabin',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(40)),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email Address',
                    labelText: 'Enter Email Address',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Enter Password',
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: new TextButton(
                      onPressed: () async {
                        if (passwordController.text == "" ||
                            emailController.text == "") {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "Empty Fields!",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                        "Please enter your information in the fields provided."),
                                    actions: [
                                      TextButton(
                                        child: Text("Okay"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ));
                          return;
                        }
                        final res = await http.post(
                            Uri.parse("http://localhost:3001/usersEnter"),
                            headers: {"Content-Type": "application/json"},
                            body: json.encode({
                              "email": emailController.text,
                              "password": passwordController.text,
                            }));

                        if (res.statusCode >= 500 && res.statusCode <= 599) {
                          final snackBarC = SnackBar(
                              content: Text(
                                  "An internal issue has occured! Please try again later."));
                          action:
                          SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBarC);
                        }
                        if (res.statusCode == 400) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "Incorrect Password!",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 161, 0, 0),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                        "Please enter your password correctly."),
                                    actions: [
                                      TextButton(
                                        child: Text("Okay"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ));
                        }
                        if (res.statusCode >= 200 && res.statusCode <= 299) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mainPage()));
                        } else if (res.statusCode == 401) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "User not found!",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 67, 194),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Image.asset(
                                      'lib/assets/userNotFound.webp',
                                      alignment: Alignment.center,
                                      height: 100,
                                    ),
                                    actions: [
                                      TextButton(
                                          child: Text("Okay"),
                                          onPressed: () =>
                                              Navigator.pop(context)),
                                    ],
                                  ));
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.none,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side:
                                      BorderSide(color: Colors.lightBlue)))))),
            ])));
  }
}
