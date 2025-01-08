import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? jobId;
  final String title;
  final String desc;
  final String company;
  final String location;
  final String logo;
  final String salary;
  final String jobTime;
  final String? postedBy;
  final List<String>? bookmarkedBy;
  final List<String>? appliedBy;
  final List<String>? acceptedUser;
  @override
  List<Object?> get props => [
        jobId,
        title,
        desc,
        company,
        location,
        jobTime,
        logo,
        postedBy,
        bookmarkedBy,
        appliedBy,
        acceptedUser,
        salary
      ];

  const JobEntity({
    this.jobId,
    required this.title,
    required this.desc,
    required this.company,
    required this.jobTime,
    required this.location,
    required this.logo,
    required this.salary,
    this.postedBy,
    this.bookmarkedBy,
    this.appliedBy,
    this.acceptedUser,
  });

  factory JobEntity.fromJson(Map<String, dynamic> json) => JobEntity(
        jobId: json["jobId"],
        title: json["title"],
        desc: json["desc"],
        jobTime: json["jobTime"],
        company: json["company"],
        location: json["location"],
        logo: json["logo"],
        salary: json["salary"],
        postedBy: json["postedBy"],
        bookmarkedBy: json["bookmarkedBy"],
        appliedBy: json["appliedBy"],
        acceptedUser: json["acceptedUser"],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "title": title,
        "desc": desc,
        "salary": salary,
        "jobTime": jobTime,
        "company": company,
        "location": location,
        "logo": logo,
        "postedBy": postedBy,
        "appliedBy": appliedBy,
        "acceptedUser": acceptedUser,
        "bookmarkedBy": bookmarkedBy,
      };

  @override
  String toString() {
    return 'JobEntity(jobId: $jobId, title: $title, jobTime: $jobTime, desc: $desc, company: $company, location: $location, salary: $salary,logo:$logo,postedBy:$postedBy,appliedBy:$appliedBy,acceptedUser:$acceptedUser,bookmarkedBy:$bookmarkedBy)';
  }
}
