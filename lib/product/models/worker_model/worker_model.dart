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
  String? cv;

  Worker({
    this.id,
    this.image,
    this.fullName,
    this.userName,
    this.userLastName,
    this.department,
    this.jobType,
    this.jobPosition,
    this.experience,
    this.cv,
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
    cv = json["cv"];
  }
}
