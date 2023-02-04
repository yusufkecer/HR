import '../job_model/job_model.dart';

class Company {
  String? companyName;
  String? sector;
  String? companyImage;
  String? phoneNumber;
  String? website;
  String? mail;
  String? numberWorker;
  String? address;

  Jobs? jobs;
  Company({
    this.companyName,
    this.sector,
    this.companyImage,
    this.phoneNumber,
    this.website,
    this.mail,
    this.numberWorker,
    this.address,
    this.jobs,
  });
}
