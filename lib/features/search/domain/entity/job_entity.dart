import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? jobId;
  final String title;
  final String desc;
  final String company;
  final String location;

  @override
  List<Object?> get props => [jobId, title, desc, company, location];

  const JobEntity({
    this.jobId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
  });

  factory JobEntity.fromJson(Map<String, dynamic> json) => JobEntity(
        jobId: json["jobId"],
        title: json["title"],
        desc: json["desc"],
        company: json["company"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "title": title,
        "desc": desc,
        "company": company,
        "location": location,
      };

  @override
  String toString() {
    return 'JobEntity(jobId: $jobId, title: $title, desc: $desc, company: $company, location: $location)';
  }
}


