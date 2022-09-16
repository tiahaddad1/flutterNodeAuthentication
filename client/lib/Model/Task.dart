import 'dart:ffi';

import 'package:video_player/video_player.dart';

import 'SubTask.dart';

class Task {
  final String taskID;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final int reminder;
  final VideoPlayer video;
  final bool isChecked;
  late SubTask subTask;

  Task({
    required this.taskID,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.reminder,
    required this.video,
    required this.isChecked,
    required this.subTask,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskID: json['taskID'],
      title: json['title'],
      description: json['description'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      reminder: json['reminder'],
      video: json['video'],
      isChecked: json['isChecked'],
      subTask: json['subTask'],
    );
  }

  String getTaskID() {
    return this.taskID;
  }

  String getTitle() {
    return this.title;
  }

  String getDescription() {
    return this.title;
  }

  String getStartTime() {
    return this.title;
  }

  String getEndTime() {
    return this.title;
  }

  int getReminder() {
    return this.reminder;
  }

  VideoPlayer getVideo() {
    return this.video;
  }

  bool isItChecked() {
    return this.isChecked;
  }

  SubTask getSubTask() {
    return this.subTask;
  }
}
