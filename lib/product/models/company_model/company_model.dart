class Company {
  String? companyName;
  String? sector;
  String? companyImage;
  Jobs? jobs;
  Company({this.companyName, this.sector, this.jobs, this.companyImage});
}

class Jobs {
  String? jobTitle;
  List? skills;
  String? timing;
  String? level;
  double? wage;
  bool? isSaveJob;
  Jobs({
    this.jobTitle,
    this.skills,
    this.timing,
    this.level,
    this.wage,
    this.isSaveJob,
  });
}
