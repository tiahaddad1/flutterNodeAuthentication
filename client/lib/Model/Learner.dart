import 'package:flutter/material.dart';
import 'package:myplanner_nodeapp/Model/Skill.dart';
import 'package:myplanner_nodeapp/Model/User.dart';
import 'Reminder.dart';
import 'Reward.dart';
import 'Task.dart';

class Learner extends User {
  final String learnerID;
  final Image image;
  final DateTime dateOfBirth;
  late List<Task> tasks;
  late List<Reminder> reminders;
  late List<Skill> skills;
  late List<Reward> rewards;

  Learner(
      {required this.learnerID,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
      required this.image,
      required this.dateOfBirth,
      required this.tasks,
      required this.reminders,
      required this.skills,
      required this.rewards});

  factory Learner.fromJson(Map<String, dynamic> json) {
    return Learner(
        learnerID: json['learnerID'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        image: json['image'],
        dateOfBirth: json['dateOfBirth'],
        tasks: json['tasks'],
        reminders: json['reminders'],
        skills: json['skills'],
        rewards: json['rewards']);
  }

  String getLearnerID() {
    return this.learnerID;
  }

  DateTime getDOB() {
    return this.dateOfBirth;
  }

  List<Task> getTasks() {
    return this.tasks;
  }

  List<Reminder> getReminders() {
    return this.reminders;
  }

  List<Skill> getSkills() {
    return this.skills;
  }

  Image getImage() {
    return this.image;
  }

  List<Reward> getRewards() {
    return this.rewards;
  }
}
