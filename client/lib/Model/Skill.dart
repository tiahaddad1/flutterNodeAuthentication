import 'package:flutter/material.dart';

class Skill {
  final String skillID;
  final String name;
  final bool isChecked;
  final Image image;
  final bool inProgress;
  final Image certificate;

  Skill({
    required this.skillID,
    required this.name,
    required this.isChecked,
    required this.image,
    required this.inProgress,
    required this.certificate,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      skillID: json['skillID'],
      name: json['name'],
      isChecked: json['isChecked'],
      image: json['image'],
      inProgress: json['inProgress'],
      certificate: json['certificate'],
    );
  }

  String getSkillID() {
    return this.skillID;
  }

  String getName() {
    return this.name;
  }

  bool isItChecked() {
    return this.isChecked;
  }

  Image getImage() {
    return this.image;
  }

  bool getInProgress() {
    return this.inProgress;
  }

  Image getCertificate() {
    return this.certificate;
  }
}
