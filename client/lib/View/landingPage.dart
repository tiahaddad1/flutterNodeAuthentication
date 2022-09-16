// import 'dart:html';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myplanner_nodeapp/Model/media_source.dart';
import 'package:myplanner_nodeapp/View/schedulePage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

// import 'mainPage.dart';

class landingPage extends StatefulWidget {
  // landingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _landingPageState();
}

Color colorByTime() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return Color.fromARGB(255, 192, 214, 255);
  }
  if (hour < 17) {
    return Color.fromARGB(255, 115, 164, 255);
  }
  return Color.fromARGB(255, 5, 13, 28);
}

Color textColor() {
  if (time < 12) {
    return Color.fromARGB(255, 1, 4, 71);
  }
  if (time < 17) {
    // return Color.fromARGB(255, 1, 4, 71);
    return Color.fromARGB(255, 0, 68, 196);
  }
  return Color.fromARGB(255, 44, 118, 255);
}

final time = DateTime.now().hour;
bool tapped = false;
String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

final String day = DateFormat("EEEEE").format(DateTime.now());
final String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
final String nOrD = DateFormat("a").format(DateTime.now());
Image imagePath =
    Image(image: AssetImage("lib/assets/camera1.png"), width: 60, height: 80);

class _landingPageState extends State<landingPage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    Future<File> saveImagePermanently(String imagePath) async {
      final directory = await getApplicationDocumentsDirectory();
      final name = basename(imagePath);
      final image = File('${directory.path}/$name');
      return File(imagePath).copy(image.path);
    }

    Future capture() async {
      try {
        // ignore: deprecated_member_use
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;

        final imageTemp = File(image.path);
        final imagePermanent = await saveImagePermanently(image.path);
        setState(() => this.image = imagePermanent); //was imageTemp

        // final MediaSource s = ModalRoute.of(context).media;
        // if (media == null) {
        //   return;
        // } else {
        //   fileMedia = media;
        // }
      } on PlatformException catch (e) {
        print("Failed to pick image: $e");
      }
    }

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  stops: [0.02, 0.02],
                  colors: [Color.fromARGB(255, 29, 81, 154), colorByTime()]),
              borderRadius: new BorderRadius.all(const Radius.circular(6.0))),
          height: 150,
          child: Row(children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 25, right: 15, left: 15),
                child: RichText(
                    text: TextSpan(
                  style: TextStyle(
                    color: textColor(),
                  ), //apply style to all
                  children: [
                    TextSpan(
                        text: greeting(),
                        style:
                            TextStyle(fontFamily: "DMSans-Bold", fontSize: 25)),
                    TextSpan(
                        text: ", USER",
                        style: TextStyle(
                            fontFamily: "DMSans-Medium",
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Today: " + day + " , " + date,
                  style: TextStyle(color: textColor(), fontSize: 15),
                ),
              ),
            ]),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(children: [
                  InkWell(
                      onTap: () {
                        if (tapped == false) {
                          capture();
                          tapped = true;
                        }
                      },
                      child: image != null
                          ? Image.file(image!, width: 90, height: 100)
                          : imagePath),
                  Text(image != null ? "" : "Upload Image",
                      style: TextStyle(
                        fontSize: 12,
                        color: textColor(),
                      )),
                ]))
          ]),
        ),
        Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(stops: [
                  0.02,
                  0.02
                ], colors: [
                  Color.fromARGB(255, 29, 81, 154),
                  Color.fromARGB(201, 242, 241, 241)
                ]),
                borderRadius: new BorderRadius.all(const Radius.circular(6.0))),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("My Schedule",
                    style: TextStyle(
                        fontFamily: "PatuaOne-Regular",
                        fontSize: 32,
                        color: Color.fromARGB(255, 29, 81, 154))),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Image.asset(
                      "lib/assets/taskImage.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "View All",
                        style: TextStyle(
                          color: Color.fromARGB(255, 20, 36, 255),
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => schedulePage()))),
                  ),
                ]),
              ],
            )),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 5),
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(stops: [
                      0.02,
                      0.02
                    ], colors: [
                      Color.fromARGB(255, 29, 81, 154),
                      Color.fromARGB(201, 242, 241, 241)
                    ]),
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(6.0))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text("Task Title",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 167, 4),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Chivo-Regular",
                                )),
                          ),
                          Row(children: [
                            Text(
                              "Next Task",
                              style: TextStyle(
                                color: Color.fromARGB(255, 29, 81, 154),
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              // alignment: Alignment.topRight,
                              iconSize: 17,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 29, 81, 154),
                              ),
                              onPressed: () {},
                            ),
                          ]),
                          //),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text("Now",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 2, 167, 4),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Chivo-Regular",
                                )),
                            padding: EdgeInsets.all(10)),
                        Container(
                          margin:
                              EdgeInsets.only(right: 20, top: 20, bottom: 20),
                          padding: EdgeInsets.all(10),
                          child: Text("Time",
                              style: TextStyle(
                                color: Color.fromARGB(255, 126, 8, 2),
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Chivo-Regular",
                              )),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: 200,
                            width: 350,
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "lib/assets/footballTaskImage.jpeg",
                              width: 350,
                              height: 350,
                            ))),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 100,
                          width: 350,
                          padding: EdgeInsets.all(15),
                          color: Color.fromARGB(199, 231, 228, 228),
                          child: Text("some data here..",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 87, 11),
                                fontSize: 18,
                                fontFamily: "Chivo-Regular",
                              ))),
                    )
                  ],
                ))),
      ],
    );
  }
}
