import 'package:flutter/material.dart';

class Reward {
  final String rewardID;
  final String name;
  final int starsReward;
  final Image image;
  final bool giveReward;

  Reward({
    required this.rewardID,
    required this.name,
    required this.starsReward,
    required this.image,
    required this.giveReward,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      rewardID: json['rewardID'],
      name: json['name'],
      starsReward: json['starsReward'],
      image: json['image'],
      giveReward: json['giveReward'],
    );
  }

  String getRewardID() {
    return this.rewardID;
  }

  String getName() {
    return this.name;
  }

  int getStarsReward() {
    return this.starsReward;
  }

  Image getImage() {
    return this.image;
  }

  bool gaveReward() {
    return this.giveReward;
  }
}
