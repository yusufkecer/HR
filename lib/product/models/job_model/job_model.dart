class Jobs {
  String? jobTitle;
  List? skills;
  String? timing;
  String? level;
  double? lowerWage;
  double? upperWage;
  String? currency;
  String? province;
  String? positionOpen;
  String? description;
  bool? isSaveJob;
  String? date;
  bool isActive;
  
  Jobs({
    this.jobTitle,
    this.skills,
    this.timing,
    this.level,
    this.lowerWage,
    this.upperWage,
    this.currency,
    this.province,
    this.positionOpen,
    this.description,
    this.isSaveJob,
    this.date,
    this.isActive = true,
  });
}
