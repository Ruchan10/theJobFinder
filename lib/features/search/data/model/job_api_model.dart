import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/job_entity.dart';

part 'job_api_model.g.dart';

final jobApiModelProvider = Provider<JobApiModel>(
  (ref) => JobApiModel.empty(),
);

@JsonSerializable()
class JobApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? jobId;
  final String title;
  final String desc;
  final String company;
  final String location;
  final String logo;
  final String postedBy;
  final List<String> bookmarkedBy;
  final List<String> appliedBy;
  final List<String> acceptedUser;

  const JobApiModel({
    required this.jobId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
    required this.logo,
    required this.postedBy,
    required this.bookmarkedBy,
    required this.appliedBy,
    required this.acceptedUser,
  });
  JobApiModel.empty()
      : jobId = '',
        title = '',
        desc = '',
        company = '',
        logo = '',
        postedBy = '',
        bookmarkedBy = [],
        appliedBy = [],
        acceptedUser = [],
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
        logo: logo,
        postedBy: postedBy,
        bookmarkedBy: bookmarkedBy,
        appliedBy: appliedBy,
        acceptedUser: acceptedUser,
      );

  // Convert Entity to API Object
  JobApiModel fromEntity(JobEntity entity) => JobApiModel(
        jobId: entity.jobId ?? '',
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        location: entity.location,
        logo: entity.logo,
        postedBy: entity.postedBy,
        bookmarkedBy: entity.bookmarkedBy,
        appliedBy: entity.appliedBy,
        acceptedUser: entity.acceptedUser,
      );

  // Convert API List to Entity List
  List<JobEntity> toEntityList(List<JobApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        jobId,
        title,
        desc,
        company,
        location,
        postedBy,
        logo,
        acceptedUser,
        appliedBy,
        bookmarkedBy
      ];
}
