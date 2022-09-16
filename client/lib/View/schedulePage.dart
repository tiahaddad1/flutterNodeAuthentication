import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class schedulePage extends StatefulWidget {
  const schedulePage({Key? key}) : super(key: key);

  @override
  State<schedulePage> createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  final picker = ImagePicker();
  final picker1 = ImagePicker();
  final picker2 = ImagePicker();
  File? _video;
  File? _video1;
  File? _video2;
  bool vid = false;
  bool vid1 = false;
  bool vid2 = false;
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

  videoChooser1() async {
    // ignore: deprecated_member_use
    final video = await picker1.getVideo(source: ImageSource.gallery);
    _video1 = File(video!.path);
    _controller1 = VideoPlayerController.file(_video1!)
      ..initialize().then((_) {
        setState(() {});
        // _controller.play();
      });
  }

  videoChooser2() async {
    // ignore: deprecated_member_use
    final video = await picker2.getVideo(source: ImageSource.gallery);
    _video2 = File(video!.path);
    _controller2 = VideoPlayerController.file(_video2!)
      ..initialize().then((_) {
        setState(() {});
        // _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
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
                "Today's Schedule",
                style: TextStyle(
                  fontSize: 33,
                  color: Color.fromARGB(255, 29, 81, 154),
                  fontFamily: "PatuaOne-Regular",
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            leading: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 255, 255),
              ),
              icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () => Navigator.of(context).pop(),
              label: const Text(
                "Go Back",
                style: TextStyle(color: Colors.black),
              ),
            )),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.10
                  ], colors: [
                    Color.fromARGB(255, 38, 180, 67),
                    Color.fromARGB(255, 21, 132, 43)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 126, 126, 126).withOpacity(0.5),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Done",
                            style: TextStyle(
                                color: Color.fromARGB(255, 208, 244, 202),
                                fontFamily: 'HoltwoodOneSC-Regular',
                                fontSize: 22),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "22:00",
                            style: TextStyle(
                                color: Color.fromARGB(255, 208, 244, 202),
                                fontFamily: 'HoltwoodOneSC-Regular',
                                fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              videoChooser();
                              vid = true;
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
                        Container(
                          width: 150,
                          height: 100,
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Brush your teeth gently.",
                              style: TextStyle(
                                  fontFamily: "DMSans-Bold",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    if (vid == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: InkWell(
                                onTap: () {
                                  _controller.play();
                                },
                                child: Image.asset(
                                  'lib/assets/play-button.png',
                                  width: 25,
                                  height: 25,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () {
                                  _controller.pause();
                                },
                                child: Image.asset(
                                  'lib/assets/pause-button.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ))
                        ],
                      ),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.10
                  ], colors: [
                    Color.fromARGB(255, 233, 194, 117),
                    Color.fromARGB(255, 216, 144, 0)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 126, 126, 126).withOpacity(0.5),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Coming Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 235, 176),
                                fontFamily: 'HoltwoodOneSC-Regular',
                                fontSize: 22),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "23:00",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 235, 176),
                                fontFamily: 'HoltwoodOneSC-Regular',
                                fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              videoChooser1();
                              vid1 = true;
                            },
                            child: Container(
                                width: 200,
                                height: 100,
                                child: _video1 != null
                                    ? AspectRatio(
                                        aspectRatio: 3 / 2,
                                        child: VideoPlayer(_controller1),
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
                        Container(
                          width: 150,
                          height: 100,
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Wear your sleep wear.",
                              style: TextStyle(
                                  fontFamily: "DMSans-Bold",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    if (vid1 == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: InkWell(
                                onTap: () {
                                  _controller1.play();
                                },
                                child: Image.asset(
                                  'lib/assets/play-button.png',
                                  width: 25,
                                  height: 25,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () {
                                  _controller1.pause();
                                },
                                child: Image.asset(
                                  'lib/assets/pause-button.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ))
                        ],
                      ),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.10
                  ], colors: [
                    Color.fromARGB(255, 149, 149, 149),
                    Color.fromARGB(255, 100, 100, 99)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 126, 126, 126).withOpacity(0.5),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Later",
                            style: TextStyle(
                                color: Color.fromARGB(255, 159, 159, 159),
                                fontFamily: 'HoltwoodOneSC-Regular',
                                fontSize: 22),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "00:00",
                            style: TextStyle(
                                color: Color.fromARGB(255, 159, 159, 159),
                                fontFamily: 'HoltwoodOneSC-Regular',
                                fontSize: 22),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              videoChooser2();
                              vid2 = true;
                            },
                            child: Container(
                                width: 200,
                                height: 100,
                                child: _video2 != null
                                    ? AspectRatio(
                                        aspectRatio: 3 / 2,
                                        child: VideoPlayer(_controller2),
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
                        Container(
                          width: 150,
                          height: 100,
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Getting ready for bed time.",
                              style: TextStyle(
                                  fontFamily: "DMSans-Bold",
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    if (vid2 == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: InkWell(
                                onTap: () {
                                  _controller2.play();
                                },
                                child: Image.asset(
                                  'lib/assets/play-button.png',
                                  width: 25,
                                  height: 25,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () {
                                  _controller2.pause();
                                },
                                child: Image.asset(
                                  'lib/assets/pause-button.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ))
                        ],
                      ),
                  ],
                )),
          ],
        ));
  }
}
