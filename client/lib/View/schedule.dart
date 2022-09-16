import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'addTask.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key}) : super(key: key);

  @override
  State<schedule> createState() => _scheduleState();
}

final String date = DateFormat.yMMMMd().format(DateTime.now());
Random random = new Random();
int randomNumber = random.nextInt(2) + 0;
List<Color> containerColor = [
  Color.fromARGB(255, 122, 3, 47),
  Color.fromARGB(255, 238, 155, 29),
  Color.fromARGB(255, 90, 20, 251)
];

class _scheduleState extends State<schedule> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    date,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Lato-Regular",
                        color: Color.fromARGB(255, 135, 134, 134)),
                  )),
              Text("Today",
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: "Lato-Regular",
                      fontWeight: FontWeight.bold)),
            ]),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addTaskPage()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.pink),
              child: Text(
                "+ Add Task",
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
      Container(
        margin: EdgeInsets.only(left: 20),
        child: DatePicker(DateTime.now(),
            onDateChange: (selectedDate) => _selectedDate = selectedDate,
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.pink,
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey)),
      ),
      SizedBox(
        height: 40,
      ),
      Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                Container(
                    width: 350,
                    height: 150,
                    // color: Colors.pink,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: containerColor[randomNumber]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10, left: 15),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: "Cabin",
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 10, left: 15),
                                    child: Row(children: [
                                      Container(
                                          child: Icon(
                                        Icons.access_time,
                                        size: 17,
                                        color: Colors.white,
                                      )),
                                      SizedBox(width: 8),
                                      Text(
                                        "10:00 - 11:00",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Cabin",
                                        ),
                                      )
                                    ])),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 15),
                                  child: Row(children: [
                                    Container(
                                        child: Icon(
                                      Icons.timer,
                                      size: 17,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    )),
                                    SizedBox(width: 8),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: "Cabin",
                                      ),
                                    )
                                  ]),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 10, left: 15),
                                    child: Text("Description...",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Cabin",
                                        )))
                              ]),
                          Column(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, right: 20, bottom: 20),
                                child: Image.asset(
                                  "lib/assets/footballTaskImage.jpeg",
                                  width: 155,
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 150),
                                padding: EdgeInsets.only(left: 5, right: 5),
                                color: Color.fromARGB(255, 196, 0, 0),
                                // padding: EdgeInsets.only(left: 120),
                                child: Icon(Icons.delete_rounded,
                                    size: 18,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ])
                        ])),
                const ExpansionTile(
                  title: Text("View SubTasks"),
                  leading: Icon(
                    Icons.task,
                    color: Colors.blue,
                  ),
                  backgroundColor: Color.fromARGB(255, 241, 240, 240),
                  // collapsedBackgroundColor: Color.fromARGB(255, 164, 22, 22),
                  children: [
                    ListTile(
                      title: Text("SubTask 1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue)),
                      subtitle: Text("10 stars",
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 15)),
                    ),
                    ListTile(
                      title: Text("SubTask 2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue)),
                      subtitle: Text(
                        "5 stars",
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 15),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "11:15 - 11:30",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(255, 1, 97, 6)),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.only(right: 240),
                //   height: 40,
                //   width: 100,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: Colors.blue,
                //   ),
                // )
              ])
            ],
          )),
    ]);
  }
}
