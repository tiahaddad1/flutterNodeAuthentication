import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myplanner_nodeapp/View/addTask.dart';

class addSubTask extends StatefulWidget {
  const addSubTask({super.key});

  @override
  State<addSubTask> createState() => _addSubTaskState();
}

final subtask1TitleController = TextEditingController();
final subtask1StartTimeController = TextEditingController();
final subtask1RewardController = TextEditingController();
final subtask1EndTimeController = TextEditingController();

final subtask2TitleController = TextEditingController();
final subtask2StartTimeController = TextEditingController();
final subtask2RewardController = TextEditingController();
final subtask2EndTimeController = TextEditingController();
bool newSubTask = false;

class _addSubTaskState extends State<addSubTask> {
  File? image;
  File? image1;
  @override
  Widget build(BuildContext context) {
    bool tapped = false;
    Image imagePath =
        Image(image: AssetImage("lib/assets/photo.png"), width: 70, height: 80);
    bool tapped1 = false;
    Image imagePath1 =
        Image(image: AssetImage("lib/assets/photo.png"), width: 70, height: 80);
    Future capture() async {
      try {
        // ignore: deprecated_member_use
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;

        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp); //was imageTemp

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

    Future capture1() async {
      try {
        // ignore: deprecated_member_use
        final image1 =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image1 == null) return;

        final imageTemp1 = File(image1.path);
        setState(() => this.image1 = imageTemp1); //was imageTemp

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

    String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
    String endTime = "09:30 PM";
    String startTime1 = DateFormat("hh:mm a").format(DateTime.now()).toString();
    String endTime1 = "09:30 PM";
    showTime() {
      return showTimePicker(
          initialEntryMode: TimePickerEntryMode.input,
          context: context,
          initialTime: TimeOfDay(
              hour: int.parse(startTime.split(":")[0]),
              minute: int.parse(startTime.split(":")[1].split(" ")[0])));
    }

    getTime({required bool isStartTime}) async {
      //WORK ON THIS

      var pickedTime = await showTime();
      String formattedTime = pickedTime!.format(context);
      if (pickedTime == null) {
        print("Time not selected");
      } else if (isStartTime == true) {
        setState(() {
          startTime = formattedTime;
        });
      } else if (isStartTime == false) {
        setState(() {
          endTime = formattedTime;
        });
      }
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(),
            ),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            automaticallyImplyLeading: false,
            leadingWidth: 100,
            title: Align(
              child: Text(
                "New SubTask",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 45, 119, 223),
                  fontFamily: "Lato-Regular",
                ),
              ),
              alignment: Alignment.center,
            ),
            leading: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 255, 255),
              ),
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () => Navigator.of(context).pop(),
              label: const Text(
                "Go Back",
                style: TextStyle(color: Colors.black),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.10
                  ], colors: [
                    Color.fromARGB(255, 255, 233, 174),
                    Color.fromARGB(255, 255, 233, 174)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 126, 126, 126).withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 65,
                child: Row(
                  children: [
                    Padding(
                        child: Image.asset("lib/assets/information.png",
                            width: 40, height: 40),
                        padding: EdgeInsets.all(10)),
                    Text(
                        "Please ensure the Start Time of the\nnew Subtask is after the Task's End Time.",
                        style: TextStyle(fontSize: 14)),
                  ],
                )),
            Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.10
                  ], colors: [
                    Color.fromARGB(255, 251, 249, 249),
                    Color.fromARGB(255, 251, 249, 249)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 126, 126, 126).withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 465,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Text("SubTask 1 Title:",
                                  style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Start Time:",
                                  style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text("End Time:",
                                    style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                        fontSize: 18,
                                        color: Colors.black))),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: Text(
                                  "Reward:",
                                  style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                          ])),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 200,
                        child: Column(children: [
                          TextFormField(
                              autofocus: false,
                              cursorColor: Color.fromARGB(255, 45, 119, 223),
                              controller: subtask1TitleController,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lato-Regular",
                                  fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                              )),
                          SizedBox(
                              width: 200,
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    autofocus: false,
                                    cursorColor:
                                        Color.fromARGB(255, 45, 119, 223),
                                    controller: subtask1StartTimeController,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Lato-Regular",
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
                                        hintText: startTime,
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.access_time_rounded,
                                      color: Color.fromARGB(255, 45, 119, 223),
                                    ),
                                    onPressed: () {
                                      getTime(isStartTime: true);
                                    },
                                  ),
                                )
                              ])),
                          SizedBox(
                              width: 200,
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    autofocus: false,
                                    cursorColor:
                                        Color.fromARGB(255, 45, 119, 223),
                                    controller: subtask1EndTimeController,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Lato-Regular",
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
                                        hintText: endTime,
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.access_time_rounded,
                                      color: Color.fromARGB(255, 45, 119, 223),
                                    ),
                                    onPressed: () {
                                      getTime(isStartTime: false);
                                    },
                                  ),
                                )
                              ])),
                          SizedBox(
                              width: 200,
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    cursorColor:
                                        Color.fromARGB(255, 45, 119, 223),
                                    controller: subtask1RewardController,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Lato-Regular",
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: "5 stars!",
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                  ]),
                                )
                              ])),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 20, top: 20),
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(stops: [
                          0.02,
                          0.10
                        ], colors: [
                          Color.fromARGB(255, 251, 249, 249),
                          Color.fromARGB(255, 251, 249, 249)
                        ]),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 45, 119, 223)
                                .withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Upload image of Subtask 1:",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 18),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                            ? Image.file(image!,
                                                width: 280, height: 110)
                                            : imagePath),
                                  ]))
                            ],
                          ),
                        ],
                      )),
                ])),
            Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.10
                  ], colors: [
                    Color.fromARGB(255, 251, 249, 249),
                    Color.fromARGB(255, 251, 249, 249)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 126, 126, 126).withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 370,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Text("SubTask 2 Title:",
                                  style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            // Padding(
                            //     padding: EdgeInsets.only(bottom: 10),
                            //     child: Text(
                            //       "Start Time:",
                            //       style: TextStyle(
                            //           fontFamily: "Lato-Regular",
                            //           fontSize: 18,
                            //           color: Colors.black),
                            //     )),
                            // Padding(
                            //     padding: EdgeInsets.only(bottom: 10),
                            //     child: Text("End Time:",
                            //         style: TextStyle(
                            //             fontFamily: "Lato-Regular",
                            //             fontSize: 18,
                            //             color: Colors.black))),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 10),
                                child: Text(
                                  "Reward:",
                                  style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                      fontSize: 18,
                                      color: Colors.black),
                                )),
                          ])),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 200,
                        child: Column(children: [
                          TextFormField(
                              autofocus: false,
                              cursorColor: Color.fromARGB(255, 45, 119, 223),
                              controller: subtask2TitleController,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lato-Regular",
                                  fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                              )),
                          // SizedBox(
                          //     width: 200,
                          //     child: Row(children: [
                          //       Expanded(
                          //         child: TextFormField(
                          //           readOnly: true,
                          //           autofocus: false,
                          //           cursorColor:
                          //               Color.fromARGB(255, 118, 9, 140),
                          //           controller: subtask2StartTimeController,
                          //           style: TextStyle(
                          //               color: Colors.black,
                          //               fontFamily: "Lato-Regular",
                          //               fontSize: 16),
                          //           decoration: InputDecoration(
                          //               contentPadding:
                          //                   EdgeInsets.only(left: 10),
                          //               hintText: startTime,
                          //               focusedBorder: InputBorder.none,
                          //               border: InputBorder.none,
                          //               enabledBorder: InputBorder.none),
                          //         ),
                          //       ),
                          //       Container(
                          //         child: IconButton(
                          //           icon: Icon(
                          //             Icons.access_time_rounded,
                          //             color: Color.fromARGB(255, 118, 9, 140),
                          //           ),
                          //           onPressed: () {
                          //             getTime(isStartTime: true);
                          //           },
                          //         ),
                          //       )
                          //     ])),
                          // SizedBox(
                          //     width: 200,
                          //     child: Row(children: [
                          //       Expanded(
                          //         child: TextFormField(
                          //           readOnly: true,
                          //           autofocus: false,
                          //           cursorColor:
                          //               Color.fromARGB(255, 118, 9, 140),
                          //           controller: subtask2EndTimeController,
                          //           style: TextStyle(
                          //               color: Colors.black,
                          //               fontFamily: "Lato-Regular",
                          //               fontSize: 16),
                          //           decoration: InputDecoration(
                          //               contentPadding:
                          //                   EdgeInsets.only(left: 10),
                          //               hintText: endTime,
                          //               focusedBorder: InputBorder.none,
                          //               border: InputBorder.none,
                          //               enabledBorder: InputBorder.none),
                          //         ),
                          //       ),
                          //       Container(
                          //         child: IconButton(
                          //           icon: Icon(
                          //             Icons.access_time_rounded,
                          //             color: Color.fromARGB(255, 118, 9, 140),
                          //           ),
                          //           onPressed: () {
                          //             getTime(isStartTime: false);
                          //           },
                          //         ),
                          //       )
                          //     ])),
                          SizedBox(
                              width: 200,
                              child: Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    cursorColor:
                                        Color.fromARGB(255, 45, 119, 223),
                                    controller: subtask2RewardController,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Lato-Regular",
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: "5 stars!",
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                  ]),
                                )
                              ])),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 20, top: 20),
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(stops: [
                          0.02,
                          0.10
                        ], colors: [
                          Color.fromARGB(255, 251, 249, 249),
                          Color.fromARGB(255, 251, 249, 249)
                        ]),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 45, 119, 223)
                                .withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Upload image of Subtask 2:",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 18),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(children: [
                                    InkWell(
                                        onTap: () {
                                          if (tapped1 == false) {
                                            capture1();
                                            tapped1 = true;
                                          }
                                        },
                                        child: image1 != null
                                            ? Image.file(image1!,
                                                width: 280, height: 110)
                                            : imagePath1),
                                  ]))
                            ],
                          ),
                        ],
                      )),
                ])),
            GestureDetector(
              onTap: () {
                if (subtask1TitleController == null ||
                    subtask1StartTimeController == null ||
                    subtask1EndTimeController == null ||
                    subtask1RewardController == null ||
                    image == null ||
                    subtask2TitleController == null ||
                    subtask2RewardController == null ||
                    image1 == null) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              "Some fields are empty!",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Image.asset(
                              'lib/assets/issue.png',
                              alignment: Alignment.center,
                              height: 100,
                            ),
                            actions: [
                              TextButton(
                                  child: Text("Okay"),
                                  onPressed: () => Navigator.pop(context)),
                            ],
                          ));
                } else {
                  newSubTask = true;
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              "Subtask Added!",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Image.asset(
                              'lib/assets/check.png',
                              alignment: Alignment.center,
                              height: 100,
                            ),
                            actions: [
                              TextButton(
                                  child: Text("Okay"),
                                  onPressed: () => Navigator.pop(context)),
                            ],
                          ));
                  if (true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addTaskPage()));
                  }
                }

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => addTaskPage()));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: 720,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 45, 119, 223)),
                child: Text(
                  "Create SubTask",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Chivo-Regular",
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
        ));
  }
}
