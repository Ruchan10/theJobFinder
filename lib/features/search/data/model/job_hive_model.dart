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

  // empty constructor
  JobHiveModel.empty() : this(jobId: '', title: '', desc:'',location:'',company:'');

  JobHiveModel({
    String? jobId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
  }) : jobId = jobId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  JobEntity toEntity() => JobEntity(
        jobId: jobId,
        title: title,
        desc: desc,
        location: location,
        company: company,
      );

  // Convert Entity to Hive Object
  JobHiveModel toHiveModel(JobEntity entity) => JobHiveModel(
        // jobId: entity.jobId,
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        location: entity.location,
      );

  // Convert Hive List to Entity List
  List<JobEntity> toEntityList(List<JobHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'jobId: $jobId, title: $title, desc:$desc, company:$company, location:$location';
  }
}
