class Job {
  final String? companyName;
  final String? companyPhone;
  final String? webSite;
  final String? level;
  final String? address;
  final String? title;
  final String? email;
  final String? currency;
  final String? jobTitle;
  final String? description;
  final List<String>? skills;
  final String? province;
  final String? password;
  final int? lowerWage;
  final int? upperWage;
  final int? positionOpen;
  final String? date;
  final String? timing;
  final DateTime? deadline;
  final bool? isActive;
  final String? id;
  final String? jobPositionId;
  final String? companyId;
  final String? totalWorker;
  final List? sector;
  final List? departments;

  Job({
    this.companyName,
    this.companyPhone,
    this.webSite,
    this.level,
    this.address,
    this.title,
    this.email,
    this.currency,
    this.jobTitle,
    this.description,
    this.skills,
    this.province,
    this.password,
    this.lowerWage,
    this.upperWage,
    this.positionOpen,
    this.date,
    this.timing,
    this.deadline,
    this.isActive = true,
    this.id,
    this.jobPositionId,
    this.companyId,
    this.totalWorker,
    this.sector,
    this.departments,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      companyId: json["employerId"],
      jobPositionId: json["jobPositionId"],
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
  factory Job.fromJsonCompanyInfo(Map<String, dynamic> json) {
    return Job(
      companyId: json["employerId"],
      sector: json["sector"],
      totalWorker: json["numberOfEmployees"],
      companyName: json['companyName'],
      companyPhone: json['companyPhone'],
      webSite: json['webSite'],
      email: json['email'],
      departments: json["departments"],
      address: json["address"],
    );
  }
  Map<String, dynamic> toJson() => {
        "title": title,
        'currency': currency,
        'experience': level,
        'employerId': companyId,
        "id": id,
        "jobPositionId": jobPositionId,
        'jobPositionName': jobTitle,
        'description': description,
        'skills': skills?.toList(),
        'city': province,
        'minSalary': lowerWage,
        'maxSalary': upperWage,
        'openPosition': positionOpen,
        'jobType': timing,
        'deadline': date,
        'status': isActive,
      };

  Map<String, dynamic> companyToJson() => {
        'companyName': companyName,
        'sector': sector,
        'companyPhone': companyPhone,
        'webSite': webSite,
        'email': email,
        "password": password,
        'numberOfEmployees': totalWorker,
        "departments": departments
        // 'address': address,
      };

  @override
  String toString() {
    return 'Job(companyName: $companyName, companyPhone: $companyPhone, webSite: $webSite, level: $level, title: $title, email: $email, currency: $currency, jobTitle: $jobTitle, description: $description, skills: $skills, province: $province, password: $password, lowerWage: $lowerWage, upperWage: $upperWage, positionOpen: $positionOpen, date: $date, timing: $timing, deadline: $deadline, isActive: $isActive, id: $id, jobPositionId: $jobPositionId, companyId: $companyId)';
  }
}
