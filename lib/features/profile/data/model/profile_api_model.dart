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
  final String fullName;
  final String email;
  final String phoneNum;
  final String cvFile;
  final String profilePic;

  const ProfileApiModel({
    required this.profileId,
    required this.fullName,
    required this.email,
    required this.phoneNum,
    required this.cvFile,
    required this.profilePic,
  });
  ProfileApiModel.empty()
      : profileId = '',
        fullName = '',
        email = '',
        phoneNum = '',
        profilePic = '',
        cvFile = '';

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  // Convert API Object to Entity
  ProfileEntity toEntity() => ProfileEntity(
        profileId: profileId,
        fullName: fullName,
        email: email,
        phoneNum: phoneNum,
        cvFile: cvFile,
        profilePic: profilePic,
      );

  // Convert Entity to API Object
  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
        profileId: entity.profileId ?? '',
        fullName: entity.fullName,
        email: entity.email,
        phoneNum: entity.phoneNum,
        cvFile: entity.cvFile,
        profilePic: entity.profilePic,
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
        cvFile,
        profilePic,
      ];
}
