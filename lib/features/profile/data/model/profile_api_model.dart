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
  final String email;
  final String desc;
  final String company;
  final String location;
  final String logo;
  final String postedBy;
  final List<String> bookmarkedBy;
  final List<String> appliedBy;
  final List<String> acceptedUser;

  const ProfileApiModel({
    required this.profileId,
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
  ProfileApiModel.empty()
      : profileId = '',
        title = '',
        desc = '',
        company = '',
        logo = '',
        postedBy = '',
        bookmarkedBy = [],
        appliedBy = [],
        acceptedUser = [],
        location = '';

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  // Convert API Object to Entity
  ProfileEntity toEntity() => ProfileEntity(
        profileId: profileId,
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
  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
        profileId: entity.profileId ?? '',
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
  List<ProfileEntity> toEntityList(List<ProfileApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        profileId,
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
