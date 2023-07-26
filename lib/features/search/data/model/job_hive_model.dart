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
  final String postedBy;
  @HiveField(7)
  final List<String> appliedBy;
  @HiveField(8)
  final List<String> bookmarkedBy;
  @HiveField(9)
  final List<String> acceptedUser;

  // empty constructor
  JobHiveModel.empty()
      : this(
            jobId: '',
            title: '',
            desc: '',
            location: '',
            company: '',
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
    required this.location,
    required this.logo,
    required this.postedBy,
    required this.appliedBy,
    required this.bookmarkedBy,
    required this.acceptedUser,
  }) : jobId = jobId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  JobEntity toEntity() => JobEntity(
        jobId: jobId,
        title: title,
        desc: desc,
        location: location,
        company: company,
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
        location: entity.location,
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
    return 'jobId: $jobId, title: $title, desc:$desc, company:$company, location:$location,logo:$logo,postedBy:$postedBy,appliedBy:$appliedBy,acceptedUser:$acceptedUser,bookmarkedBy:$bookmarkedBy';
  }
}
