import 'package:hrapp/product/models/company_model/company_model.dart';

import '../../models/job_model/job_model.dart';

class AdvertRepo {
  static final AdvertRepo singleton = AdvertRepo._internal();
  static AdvertRepo get instance {
    return singleton;
  }

  AdvertRepo._internal();
  saveJob(index) {
    if (adverts[index].jobs?.isSaveJob == false) {
      singleton.adverts[index].jobs?.isSaveJob = true;
    } else {
      singleton.adverts[index].jobs?.isSaveJob = false;
    }
  }

  List<Company> adverts = [
    Company(
      companyName: "Atık Nakit",
      sector: "Software",
      companyImage: "https://atiknakit.com/assets/images/atiknakitbeyaz.png",
      jobs: Jobs(
        upperWage: 33.000,
        lowerWage: 25.000,
        jobTitle: "UI/UX Designer",
        level: "Junior",
        skills: ["Figma", "AdobeXD"],
        timing: "Tam zamanlı",
        isSaveJob: false,
      ),
    ),
    Company(
      companyName: "Microsoft",
      sector: "Software",
      companyImage: "https://pbs.twimg.com/profile_images/1062993041324171265/CcUjyxc9_400x400.jpg",
      jobs: Jobs(
        jobTitle: "Backend Developer",
        level: "Mid",
        skills: ["Node.Js", "ASP.NET"],
        timing: "Yarı Zamanlı",
        isSaveJob: false,
        lowerWage: 25.000,
        upperWage: 26.000,
      ),
    ),
    Company(
      companyName: "Google",
      sector: "Software",
      companyImage:
          "https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1",
      jobs: Jobs(
        jobTitle: "Android Developer",
        level: "Senior",
        skills: ["Flutter", "Kotlin"],
        timing: "Yarı Zamanlı",
        isSaveJob: true,
        lowerWage: 29.000,
      ),
    ),
    Company(
      companyName: "Meta",
      sector: "Software",
      companyImage:
          "https://static.dezeen.com/uploads/2021/11/meta-facebook-rebranding-name-news_dezeen_2364_col_sq.jpg",
      jobs: Jobs(
        jobTitle: "Front-End Developer",
        level: "Junior/Senior",
        isSaveJob: false,
        skills: ["React", "React Native", "Angular"],
        timing: "Danışman",
        lowerWage: 24.000,
        upperWage: 27.000,
      ),
    ),
  ];
  AdvertRepo();

  void delete(index) {
    adverts.removeAt(index);
  }
}
