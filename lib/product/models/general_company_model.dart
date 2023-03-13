class Job {
  final String? companyName;
  final String? companyPhone;
  final String? webSite;
  final String? level;
  final String? title;
  final String? email;
  final String? currency;
  final String? jobTitle;
  final String? description;
  final List<String>? skills;
  final String? province;
  final int? lowerWage;
  final int? upperWage;
  final int? positionOpen;
  final String? date;
  final String? timing;
  final DateTime? deadline;
  final bool? isActive;
  final String id;

  Job({
    this.companyName,
    this.companyPhone,
    this.webSite,
    this.level,
    this.title,
    this.email,
    this.currency,
    this.jobTitle,
    this.description,
    this.skills,
    this.province,
    this.lowerWage,
    this.upperWage,
    this.positionOpen,
    this.date,
    this.timing,
    this.deadline,
    this.isActive = true,
    required this.id,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      currency: json["currency"],
      level: json["experience"],
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
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      'currency': currency,
      'experience': level,
      'employerId': id,
      'jobPositionName': jobTitle,
      'description': description,
      'skills': skills!.toList(),
      'city': province,
      'minSalary': lowerWage,
      'maxSalary': upperWage,
      'openPosition': positionOpen,
      'jobType': timing,
      'deadline': date,
      //'status': isActive,
    };
  }

  @override
  String toString() {
    return 'Job(id: $id, companyName: $companyName, companyPhone: $companyPhone, webSite: $webSite, level: $level, email: $email, currency: $currency, jobTitle: $jobTitle, description: $description, skills: $skills, province: $province, lowerWage: $lowerWage, upperWage: $upperWage, positionOpen: $positionOpen, timing: $timing, deadline: $deadline, isActive: $isActive, id: $id)';
  }
}
