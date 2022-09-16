import 'dart:ffi';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';
import 'homePage.dart';
import '../main.dart';
import 'signUp.dart';
import 'logIn.dart';
import 'mainPage.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold();
  // }

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<welcomePage> {
  late VideoPlayerController _controller;

  @override
  initState() {
    super.initState();
    //_controller = VideoPlayerController.network(
    //'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    _controller = VideoPlayerController.asset('lib/assets/video4.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            title: Text(
              "myPlanner",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  fontFamily: 'Righteous-Regular'),
            ),
          ),
          body: Stack(children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  )),
            ),
            makeAccount(),
          ])),
    );
  }
}

class makeAccount extends StatelessWidget {
  const makeAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          new Column(children: [
            RichText(
              text: TextSpan(
                  style:
                      TextStyle(decoration: TextDecoration.none, fontSize: 18),
                  children: [
                    TextSpan(
                      text: 'Welcome to your new guide of planning!',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    // TextSpan(
                    //     text: 'myPlanner!',
                    //     style: TextStyle(
                    //         color: Colors.red,
                    //         fontFamily: 'Righteous-Regular')),
                  ]),
            ),
            Image.asset(
              "lib/assets/logo.webp",
              width: 100,
              height: 200,
            ),
          ]),
          new Column(children: [
            Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: new TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signUP()));
                    },
                    child: Text(
                      "get started",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255))))))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("Have an account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
              RichText(
                text: TextSpan(
                    text: "Login now",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => logIn()))),
              )
            ]),
          ]),
          // RichText(
          //   text: TextSpan(
          //       text: "Demo Main Page",
          //       style: TextStyle(
          //         color: Colors.red,
          //         decoration: TextDecoration.underline,
          //         fontSize: 18,
          //       ),
          //       recognizer: TapGestureRecognizer()
          //         ..onTap = () => Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => mainPage()))),
          // )
        ]));
  }
}
