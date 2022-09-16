import 'package:flutter/material.dart';

class SubTaskOne {
  final String subTaskOneID;
  final int reward;
  final Image image;

  SubTaskOne({
    required this.subTaskOneID,
    required this.reward,
    required this.image,
  });

  factory SubTaskOne.fromJson(Map<String, dynamic> json) {
    return SubTaskOne(
      subTaskOneID: json['subTaskOneID'],
      reward: json['reward'],
      image: json['image'],
    );
  }

  String getSubTaskOneID() {
    return this.subTaskOneID;
  }

  int getSubTaskOneReward() {
    return this.reward;
  }

  Image getSubTaskOneImage() {
    return this.image;
  }
}
