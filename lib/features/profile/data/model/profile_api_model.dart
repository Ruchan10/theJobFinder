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
  final String? phoneNum;
  final String? cv;
  final String? profile;

  const ProfileApiModel({
    required this.profileId,
    this.fullName,
    this.email,
    this.phoneNum,
    this.cv,
    this.profile,
  });
  const ProfileApiModel.empty()
      : profileId = '',
        fullName = '',
        email = '',
        phoneNum = '',
        profile = '',
        cv = '';

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  // Convert API Object to Entity
  ProfileEntity toEntity() => ProfileEntity(
        profileId: profileId,
        fullName: fullName,
        email: email,
        phoneNum: phoneNum,
        cv: cv,
        profile: profile,
      );

  // Convert Entity to API Object
  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
        profileId: entity.profileId ?? '',
        fullName: entity.fullName,
        email: entity.email,
        phoneNum: entity.phoneNum,
        cv: entity.cv,
        profile: entity.profile,
      );

  // Convert API List to Entity List
  List<ProfileEntity> toEntityList(List<ProfileApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        profileId,
        fullName,
        email,
        phoneNum,
        cv,
        profile,
      ];
}
