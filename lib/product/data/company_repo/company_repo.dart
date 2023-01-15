import 'package:hrapp/product/models/company_model/company_model.dart';

import '../../models/job_model/job_model.dart';

class CompanyRepo {
  List<Company> companys = [
    Company(
      companyName: "Atık Nakit",
      sector: "Software",
      companyImage: "https://atiknakit.com/assets/images/atiknakitbeyaz.png",
      jobs: Jobs(
        jobTitle: "UI/UX Designer",
        level: "Junior",
        skills: ["Figma", "AdobeXD"],
        timing: "Yarı Zamanlı/Tam zamanlı",
        isSaveJob: false,
        wage: 39.000,
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
        timing: "Yarı Zamanlı/Tam zamanlı",
        isSaveJob: false,
        wage: 25.000,
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
        timing: "Yarı Zamanlı/Tam zamanlı",
        isSaveJob: true,
        wage: 40.000,
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
        timing: "Yarı Zamanlı/Tam zamanlı",
        wage: 24.000,
      ),
    ),
  ];

  saveJob(index) {
    if (companys[index].jobs?.isSaveJob == false) {
      companys[index].jobs?.isSaveJob = true;
    } else {
      companys[index].jobs?.isSaveJob = false;
    }
  }
}
