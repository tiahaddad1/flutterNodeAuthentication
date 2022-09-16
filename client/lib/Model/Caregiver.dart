import 'Learner.dart';
import 'User.dart';

class Caregiver extends User {
  final String caregiverID;
  late List<Learner> learners;
  Caregiver(
      {required this.caregiverID,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
      required this.learners});

  factory Caregiver.fromJson(Map<String, dynamic> json) {
    return Caregiver(
        caregiverID: json['caregiverID'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        learners: json['learners']);
  }

  String getCaregiverID() {
    return this.caregiverID;
  }

  List<Learner> getLearners() {
    return this.learners;
  }
}
