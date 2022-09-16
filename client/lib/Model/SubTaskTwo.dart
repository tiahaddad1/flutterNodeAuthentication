import 'package:flutter/material.dart';

class SubTaskTwo {
  final String subTaskTwoID;
  final int reward;
  final Image image;

  SubTaskTwo({
    required this.subTaskTwoID,
    required this.reward,
    required this.image,
  });

  factory SubTaskTwo.fromJson(Map<String, dynamic> json) {
    return SubTaskTwo(
      subTaskTwoID: json['subTaskTwoID'],
      reward: json['reward'],
      image: json['image'],
    );
  }

  String getSubTaskTwoID() {
    return this.subTaskTwoID;
  }

  int getSubTaskTwoReward() {
    return this.reward;
  }

  Image getSubTaskTwoImage() {
    return this.image;
  }
}
