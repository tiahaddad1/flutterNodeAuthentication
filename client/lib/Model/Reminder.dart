class Reminder {
  final String reminderID;
  final String name;
  final bool isChecked;

  Reminder(
      {required this.reminderID, required this.name, required this.isChecked});

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      reminderID: json['reminderID'],
      name: json['name'],
      isChecked: json['isChecked'],
    );
  }

  String getReminderID() {
    return this.reminderID;
  }

  String getName() {
    return this.name;
  }

  bool isItChecked() {
    return isChecked;
  }
}
