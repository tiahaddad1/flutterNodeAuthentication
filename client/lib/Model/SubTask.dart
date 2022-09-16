import 'SubTaskOne.dart';
import 'SubTaskTwo.dart';

class SubTask {
  final String subTaskID;
  final SubTaskOne subTask1ID;
  final SubTaskTwo subTask2ID;
  final DateTime startTime;
  final DateTime endTime;

  SubTask({
    required this.subTaskID,
    required this.subTask1ID,
    required this.subTask2ID,
    required this.startTime,
    required this.endTime,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      subTaskID: json['subTaskID'],
      subTask1ID: json['subTask1ID'],
      subTask2ID: json['subTask2ID'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

  String getSubTaskID() {
    return this.subTaskID;
  }

  SubTaskOne getSubTaskOneID() {
    return this.subTask1ID;
  }

  SubTaskTwo getSubTaskTwoID() {
    return this.subTask2ID;
  }

  DateTime getStartTime() {
    return this.startTime;
  }

  DateTime getEndTime() {
    return this.endTime;
  }
}
