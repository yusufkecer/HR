class Company {
  String? companyName;
  String? sector;
  String? companyImage;
  Jobs? jobModel;
  Company({this.companyName, this.sector, this.jobModel, this.companyImage});
}

class Jobs {
  String? jobTitle;
  List? skills;
  String? timing;
  String? level;
  double? wage;
  Jobs({
    this.jobTitle,
    this.skills,
    this.timing,
    this.level,
    this.wage,
  });
}
