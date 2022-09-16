class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  }); //constructor

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password']);
    // dOB: json['dOB']);
  }

  String getFirstName() {
    return this.firstName;
  }

  String getLastName() {
    return this.lastName;
  }

  String getEmail() {
    return this.email;
  }

  // DateTime getDOB() {
  //   return this.dOB;
  // }
}
