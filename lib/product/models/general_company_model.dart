class Job {
  final String? employerId;
  final String? companyName;
  final String? companyPhone;
  final String? webSite;
  final String? level;
  final String? email;
  final String? currency;
  final String? jobTitle;
  final String? description;
  final List<String>? skills;
  final String? province;
  final int? lowerWage;
  final int? upperWage;
  final int? positionOpen;
  final String? timing;
  final DateTime? deadline;
  final bool? isActive;
  final String? id;
  final DateTime? updatedAt;

  Job({
    this.currency,
    this.level,
    this.employerId,
    this.companyName,
    this.companyPhone,
    this.webSite,
    this.email,
    this.jobTitle,
    this.description,
    this.skills,
    this.province,
    this.lowerWage,
    this.upperWage,
    this.positionOpen,
    this.timing,
    this.deadline,
    this.isActive,
    this.id,
    this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      currency: json["currency"],
      level: json["experience"],
      employerId: json['employerId'],
      companyName: json['companyName'],
      companyPhone: json['companyPhone'],
      webSite: json['webSite'],
      email: json['email'],
      jobTitle: json['jobPosition'],
      description: json['description'],
      skills: List<String>.from(json['skills']),
      province: json['city'],
      lowerWage: json['minSalary'],
      upperWage: json['maxSalary'],
      positionOpen: json['openPosition'],
      timing: json['jobType'],
      deadline: DateTime.parse(json['deadline']),
      isActive: json['status'],
      id: json['id'],
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']),
    );
  }
}
