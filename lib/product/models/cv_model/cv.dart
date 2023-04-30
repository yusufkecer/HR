class CV {
  String? informations;
  List<String>? skills;
  List<String>? languages;
  List<String>? education;
  List<String>? experiance;
  List<String>? projects;
  List<String>? socialMedia;
  List<String>? hobbies;

  CV({
    this.informations,
    this.skills,
    this.languages,
    this.education,
    this.experiance,
    this.projects,
    this.socialMedia,
    this.hobbies,
  });

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
      informations: json['informations'],
      skills: json['skills'],
      languages: json['languages'],
      education: json['education'],
      experiance: json['experiance'],
      projects: json['projects'],
      socialMedia: json['socialMedia'],
      hobbies: json['hobbies'],
    );
  }

  Map<String, dynamic> toJson() => {
        'informations': informations,
        'skills': skills,
        'languages': languages,
        'education': education,
        'experiance': experiance,
        'projects': projects,
        'socialMedia': socialMedia,
        'hobbies': hobbies,
      };
}
