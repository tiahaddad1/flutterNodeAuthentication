// import 'dart:js';

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myplanner_nodeapp/View/addSubTask.dart';
import 'package:myplanner_nodeapp/View/schedule.dart';
import 'package:myplanner_nodeapp/View/schedulePage.dart';
import 'package:video_player/video_player.dart';

final taskTitleController = TextEditingController();
final taskDescriptionController = TextEditingController();
final dateController = TextEditingController();
final startTimeController = TextEditingController();
final endTimeController = TextEditingController();
final taskReminderController = TextEditingController();

class addTaskPage extends StatefulWidget {
  const addTaskPage({super.key});

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<addTaskPage> {
  final picker = ImagePicker();
  File? _video;
  bool vid = false;
  late VideoPlayerController _controller;

  videoChooser() async {
    // ignore: deprecated_member_use
    final video = await picker.getVideo(source: ImageSource.gallery);
    _video = File(video!.path);
    _controller = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        // _controller.play();
      });
  }

  DateTime? dateNow = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = "09:30 PM";
  int selectReminder = 5;
  List<int> reminderList = [
    5,
    10,
    15,
    20,
    25,
    30,
  ];
  @override
  Widget build(BuildContext context) {
    showCalendar() async {
      DateTime? pickDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2200));
      if (DateFormat.yMd().format(pickDate!) ==
          DateFormat.yMd().format(DateTime.now())) {
        pickDate = DateTime.now().add(const Duration(days: 1));
        setState(() {
          dateNow = pickDate;
        });
      } else if (pickDate != null) {
        setState(() {
          dateNow = pickDate;
        });
      } else if (pickDate == null) {
        pickDate = dateNow;
      }
    }

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
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          title: Align(
            child: Text(
              "New Task",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
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
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Task Title",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato-Regular",
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      autofocus: false,
                      cursorColor: Colors.pink,
                      controller: taskTitleController,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato-Regular",
                          fontSize: 16),
                      decoration: InputDecoration(
                          hintText: "Enter task title",
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Task Description",
                  style: TextStyle(
                      fontFamily: "Lato-Regular",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      autofocus: false,
                      cursorColor: Colors.pink,
                      controller: taskDescriptionController,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato-Regular",
                          fontSize: 16),
                      decoration: InputDecoration(
                          hintText: "Enter task description",
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Date",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato-Regular",
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        autofocus: false,
                        cursorColor: Colors.pink,
                        controller: dateController,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Lato-Regular",
                            fontSize: 16),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: DateFormat.yMd().format(dateNow!),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          showCalendar();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "Start Time",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato-Regular",
                                fontSize: 17,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 52,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  autofocus: false,
                                  cursorColor: Colors.pink,
                                  controller: startTimeController,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Lato-Regular",
                                      fontSize: 16),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
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
                                    color: Colors.pink,
                                  ),
                                  onPressed: () {
                                    getTime(isStartTime: true);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(width: 30),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "End Time",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato-Regular",
                                fontSize: 17,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 52,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  autofocus: false,
                                  cursorColor: Colors.pink,
                                  controller: endTimeController,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Lato-Regular",
                                      fontSize: 16),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
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
                                    color: Colors.pink,
                                  ),
                                  onPressed: () {
                                    getTime(isStartTime: false);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Remind Task",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato-Regular",
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      autofocus: false,
                      cursorColor: Colors.pink,
                      controller: taskReminderController,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Lato-Regular",
                          fontSize: 16),
                      decoration: InputDecoration(
                          hintText: "$selectReminder minutes early.",
                          contentPadding: EdgeInsets.only(left: 10),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    )),
                    DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.pink),
                      iconSize: 32,
                      elevation: 4,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectReminder = int.parse(newValue!);
                        });
                      },
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Lato-Regular'),
                      underline: Container(
                        height: 0,
                      ),
                      items: reminderList
                          .map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()));
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
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
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Upload video of task",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Lato-Regular',
                              fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                videoChooser();
                                print(_video);
                              },
                              child: Container(
                                  width: 200,
                                  height: 100,
                                  child: _video != null
                                      ? AspectRatio(
                                          aspectRatio: 3 / 2,
                                          child: VideoPlayer(_controller),
                                        )
                                      : Container(
                                          alignment: Alignment.bottomLeft,
                                          padding: EdgeInsets.only(left: 40),
                                          width: 200,
                                          height: 100,
                                          child: Image.asset(
                                            "lib/assets/uploadVid.webp",
                                          ),
                                        ))),
                        ],
                      ),
                    ],
                  )),
              Row(children: [
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Icon(
                      Icons.add_box_outlined,
                      color: Color.fromARGB(255, 45, 119, 223),
                    )),
                RichText(
                  text: TextSpan(
                      text: "Add SubTask",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 17,
                          fontFamily: "Lato-Regular"),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addSubTask()))),
                ),
              ]),
              GestureDetector(
                onTap: () {
                  if (taskTitleController == null ||
                      taskDescriptionController == null ||
                      dateController == null ||
                      startTimeController == null ||
                      endTimeController == null ||
                      _video == null) {
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
                    if (true) {
                      if (newSubTask == false) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    "No Subtask?",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: Image.asset(
                                    'lib/assets/check-list.png',
                                    alignment: Alignment.center,
                                    height: 100,
                                  ),
                                  actions: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            child: Text("Nope!"),
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text(
                                                        "Task Created!",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: Image.asset(
                                                        'lib/assets/check.png',
                                                        alignment:
                                                            Alignment.center,
                                                        height: 100,
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            child: Text("Okay"),
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop()),
                                                      ],
                                                    )),
                                          ),
                                          TextButton(
                                              child: Text("Oops, I forgot!"),
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addSubTask())))
                                        ])
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    "Task Created!",
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
                                        onPressed: () => Navigator.pop(context))
                                    // Navigator.pop(context)),
                                  ],
                                ));
                      }
                    }
                  }
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: 780,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink),
                  child: Text(
                    "Create Task",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Chivo-Regular",
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
