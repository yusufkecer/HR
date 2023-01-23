class Worker {
  int? id;
  String? image;
  String? fullName;
  String? userName;
  String? userLastName;
  String? department;
  String? jobType;
  String? jobPosition;
  String? experience;

  Worker({
    this.id,
    this.image,
    this.userLastName,
    this.department,
    this.experience,
    this.jobType,
    this.jobPosition,
  });
  Worker.fromJson(json) {
    image = json["image"];
    fullName = json["fullName"];
    userName = json["userName"];
    userLastName = json["userLastName"];
    department = json["department"];
    jobType = json["jobType"];
    jobPosition = json["jobPosition"];
    experience = (json["experience"]).toString();
    id = int.parse(json["id"]);
  }
}
