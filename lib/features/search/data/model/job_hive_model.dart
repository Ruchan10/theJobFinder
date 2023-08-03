import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/job_entity.dart';

part 'job_hive_model.g.dart';

final jobHiveModelProvider = Provider(
  (ref) => JobHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.jobTableId)
class JobHiveModel {
  @HiveField(0)
  final String jobId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final String company;
  @HiveField(4)
  final String location;
  @HiveField(5)
  final String logo;
  @HiveField(6)
  final String? postedBy;
  @HiveField(7)
  final List<String>? appliedBy;
  @HiveField(8)
  final List<String>? bookmarkedBy;
  @HiveField(9)
  final List<String>? acceptedUser;
  @HiveField(10)
  final String salary;
  @HiveField(11)
  final String jobTime;
  // empty constructor
  JobHiveModel.empty()
      : this(
            jobId: '',
            title: '',
            desc: '',
            location: '',
            company: '',
            jobTime: '',
            salary: '',
            logo: '',
            postedBy: '',
            appliedBy: [],
            bookmarkedBy: [],
            acceptedUser: []);

  JobHiveModel({
    String? jobId,
    required this.title,
    required this.desc,
    required this.company,
    required this.jobTime,
    required this.location,
    required this.salary,
    required this.logo,
    this.postedBy,
    this.appliedBy,
    this.bookmarkedBy,
    this.acceptedUser,
  }) : jobId = jobId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  JobEntity toEntity() => JobEntity(
        jobId: jobId,
        title: title,
        desc: desc,
        location: location,
        company: company,
        salary: salary,
        jobTime: jobTime,
        logo: logo,
        postedBy: postedBy,
        appliedBy: appliedBy,
        acceptedUser: acceptedUser,
        bookmarkedBy: bookmarkedBy,
      );

  // Convert Entity to Hive Object
  JobHiveModel toHiveModel(JobEntity entity) => JobHiveModel(
        // jobId: entity.jobId,
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        jobTime: entity.jobTime,
        location: entity.location,
        salary: entity.salary,
        logo: entity.logo,
        postedBy: entity.postedBy,
        appliedBy: entity.appliedBy,
        acceptedUser: entity.acceptedUser,
        bookmarkedBy: entity.bookmarkedBy,
      );

  // Convert Hive List to Entity List
  List<JobEntity> toEntityList(List<JobHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'jobId: $jobId, title: $title, desc:$desc, company:$company, jobTime:$jobTime, location:$location,logo:$logo,salary:$salary,postedBy:$postedBy,appliedBy:$appliedBy,acceptedUser:$acceptedUser,bookmarkedBy:$bookmarkedBy';
  }
}
