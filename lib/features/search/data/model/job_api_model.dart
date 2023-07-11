import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/job_entity.dart';

part 'job_api_model.g.dart';

final jobApiModelProvider = Provider<JobApiModel>(
  (ref) => const JobApiModel.empty(),
);

@JsonSerializable()
class JobApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? jobId;
  final String title;
  final String desc;
  final String company;
  final String location;

  const JobApiModel({
    required this.jobId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
  });
  const JobApiModel.empty()
      : jobId = '',
        title = '',
        desc = '',
        company = '',
        location = '';

  Map<String, dynamic> toJson() => _$JobApiModelToJson(this);

  factory JobApiModel.fromJson(Map<String, dynamic> json) =>
      _$JobApiModelFromJson(json);

  // Convert API Object to Entity
  JobEntity toEntity() => JobEntity(
        jobId: jobId,
        title: title,
        desc: desc,
        company: company,
        location: location,
      );

  // Convert Entity to API Object
  JobApiModel fromEntity(JobEntity entity) => JobApiModel(
        jobId: entity.jobId ?? '',
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        location: entity.location,
      );

  // Convert API List to Entity List
  List<JobEntity> toEntityList(List<JobApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [jobId, title, desc, company, location];
}
