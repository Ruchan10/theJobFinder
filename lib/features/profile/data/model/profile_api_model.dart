import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_api_model.g.dart';

final profileApiModelProvider = Provider<ProfileApiModel>(
  (ref) => ProfileApiModel.empty(),
);

@JsonSerializable()
class ProfileApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? profileId;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? cv;
  final String? profile;
  final String? password;
  final List<String>? bookmarkedJobs;
  final List<String>? appliedJobs;

  const ProfileApiModel({
    required this.profileId,
    this.fullName,
    this.email,
    this.appliedJobs,
    this.bookmarkedJobs,
    this.password,
    this.phoneNumber,
    this.cv,
    this.profile,
  });
  ProfileApiModel.empty()
      : profileId = '',
        fullName = '',
        email = '',
        phoneNumber = '',
        profile = '',
        bookmarkedJobs = [],
        appliedJobs = [],
        password = '',
        cv = '';

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  ProfileEntity toEntity() => ProfileEntity(
        profileId: profileId,
        fullName: fullName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        bookmarkedJobs: bookmarkedJobs,
        appliedJobs: appliedJobs,
        cv: cv,
        profile: profile,
      );

  // Convert Entity to API Object
  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
        profileId: entity.profileId ?? '',
        fullName: entity.fullName,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        cv: entity.cv,
        password: entity.password,
        profile: entity.profile,
        bookmarkedJobs: entity.bookmarkedJobs,
        appliedJobs: entity.appliedJobs,
      );

  // Convert API List to Entity List
  List<ProfileEntity> toEntityList(List<ProfileApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        profileId,
        fullName,
        email,
        password,
        phoneNumber,
        bookmarkedJobs,
        appliedJobs,
        profile,
        cv,
        profile,
      ];
}
