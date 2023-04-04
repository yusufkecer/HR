class User {
  final int? id;
  final String? phoneNumber;
  final String? name;
  final String? surname;
  final String? email;
  final DateTime? birthOfDay;
  final String? birthDay;
  final String? cv;
  final String? password;
  User({
    this.id,
    this.phoneNumber,
    this.name,
    this.surname,
    this.email,
    this.birthOfDay,
    this.birthDay,
    this.cv,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      birthOfDay: json['birthOfDay'],
      cv: json['cv'],
    );
  }


  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'firstName': name,
        'lastName': surname,
        'email': email,
        'DateOfBirth': birthDay,
        'password': password
      };
}
