import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/profile_entity.dart';

part 'profile_hive_model.g.dart';

final profileHiveModelProvider = Provider(
  (ref) => ProfileHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.profileTableId)
class ProfileHiveModel {
  @HiveField(0)
  final String profileId;
  @HiveField(1)
  final String? fullName;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  final String? cv;
  @HiveField(5)
  final String? profile;
  @HiveField(6)
  final String? password;
  @HiveField(7)
  final List<String>? appliedJobs;
  @HiveField(8)
  final List<String>? bookmarkedJobs;

  // empty constructor
  ProfileHiveModel.empty()
      : this(
          profileId: '',
          fullName: '',
          email: '',
          cv: '',
          phoneNumber: '',
          profile: '',
          password: '',
          appliedJobs: [],
          bookmarkedJobs: [],
        );

  ProfileHiveModel({
    String? profileId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.cv,
    this.profile,
    this.password,
    this.bookmarkedJobs,
    this.appliedJobs,
  }) : profileId = profileId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  ProfileEntity toEntity() => ProfileEntity(
        profileId: profileId,
        fullName: fullName,
        email: email,
        cv: cv,
        password: password,
        phoneNumber: phoneNumber,
        bookmarkedJobs: bookmarkedJobs,
        appliedJobs: appliedJobs,
        profile: profile,
      );

  // Convert Entity to Hive Object
  ProfileHiveModel toHiveModel(ProfileEntity entity) => ProfileHiveModel(
        // profileId: entity.profileId,
        fullName: entity.fullName,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        cv: entity.cv,
        password: entity.password,
        profile: entity.profile,
        bookmarkedJobs: entity.bookmarkedJobs,
        appliedJobs: entity.appliedJobs,
      );

  // Convert Hive List to Entity List
  List<ProfileEntity> toEntityList(List<ProfileHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'profileId: $profileId, fullName: $fullName, email:$email, phoneNum:$phoneNumber, cv:$cv,profile:$profile, appliedJobs:$appliedJobs,bookmarkedJobs:$bookmarkedJobs,password:$password,';
  }
}
