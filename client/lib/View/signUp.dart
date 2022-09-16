import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:myplanner_nodeapp/View/logIn.dart';
import 'package:myplanner_nodeapp/View/mainPage.dart';
import 'package:myplanner_nodeapp/View/mainScreen.dart';

class signUP extends StatefulWidget {
  const signUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  State<signUP> createState() => _signUPState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final repasswordController = TextEditingController();

class _signUPState extends State<signUP> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              automaticallyImplyLeading: false,
              leadingWidth: 100,
              title: Text("Sign Up"),
              leading: ElevatedButton.icon(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
                label: const Text("Go Back"),
              )),
          body: enterDetails(),
        ));
  }
}

class enterDetails extends StatelessWidget {
  const enterDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Align(
        alignment: Alignment.center,
        child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "lib/assets/community.jpeg",
                          width: 400,
                          height: 210,
                        )),
                    Padding(
                      child: Text(
                        "Become a member now!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontFamily: 'Cabin',
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Forename',
                                    hintText: 'Your forename',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return "Please enter a valid name";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Surname',
                                    hintText: 'Your surname',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return "Please enter a valid name";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Enter E-mail',
                                    hintText: 'E-mail Address',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                            .hasMatch(value)) {
                                      return "Please enter a valid e-mail address";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Enter New Password',
                                    hintText: 'New Password',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.length < 7 ||
                                        !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                                            .hasMatch(value)) {
                                      return "Password must have special characters, numbers, [A-Z a-z]";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                    controller: repasswordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Re-Enter Password",
                                      labelText: "Password",
                                    ))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                child: new TextButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        print("Inputs are OK");
                                      } else {
                                        print("Inputs are incorrectly entered");
                                        return;
                                      }

                                      if (repasswordController.text !=
                                          passwordController.text) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text(
                                                    "Incorrect Password!",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                          255,
                                                          158,
                                                          11,
                                                          0,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  content: Text(
                                                      "Please re-enter your password correctly"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("Okay"),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    ),
                                                  ],
                                                ));
                                        return;
                                      }

                                      final res = await http.post(
                                          Uri.parse(
                                              "http://localhost:3001/users"),
                                          headers: {
                                            "Content-Type": "application/json"
                                          },
                                          body: json.encode({
                                            "firstName":
                                                firstNameController.text,
                                            "lastName": lastNameController.text,
                                            "email": emailController.text,
                                            "password": passwordController.text,
                                          }));
                                      if (res.statusCode >= 400 &&
                                          res.statusCode <= 499) {
                                        final snackBarC = SnackBar(
                                            content: Text(
                                                "An issue has occured! Please ensure your details are entered correctly."));
                                        action:
                                        SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {},
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarC);
                                      }
                                      if (res.statusCode >= 500 &&
                                          res.statusCode <= 599) {
                                        final snackBarC = SnackBar(
                                            content: Text(
                                                "An internal issue has occured! Please try again later."));
                                        action:
                                        SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {},
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarC);
                                      }
                                      if (res.statusCode >= 200 &&
                                          res.statusCode <= 299) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text(
                                                    "Account Created!",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 4, 194, 26),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  content: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Image.asset(
                                                        'lib/assets/success.png',
                                                        alignment:
                                                            Alignment.center,
                                                        height: 80,
                                                      )),
                                                  actions: [
                                                    TextButton(
                                                        child:
                                                            Text("Log me in!"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          if (true) {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            logIn()));
                                                          }
                                                        }),
                                                  ],
                                                ));
                                      }
                                    },
                                    child: Text(
                                      "Sign me up!",
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
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: BorderSide(
                                                    color:
                                                        Colors.lightBlue)))))),
                          ],
                        ))
                  ]),
            )));
  }
}
