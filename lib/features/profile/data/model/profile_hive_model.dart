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
  ProfileHiveModel.empty()
      : this(
            profileId: '',
            title: '',
            desc: '',
            location: '',
            company: '',
            logo: '',
            postedBy: '',
            appliedBy: [],
            bookmarkedBy: [],
            acceptedUser: []);

  ProfileHiveModel({
    String? profileId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
    required this.logo,
    required this.postedBy,
    required this.appliedBy,
    required this.bookmarkedBy,
    required this.acceptedUser,
  }) : profileId = profileId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  ProfileEntity toEntity() => ProfileEntity(
        profileId: profileId,
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
  ProfileHiveModel toHiveModel(ProfileEntity entity) => ProfileHiveModel(
        // profileId: entity.profileId,
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
  List<ProfileEntity> toEntityList(List<ProfileHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'profileId: $profileId, title: $title, desc:$desc, company:$company, location:$location,logo:$logo,postedBy:$postedBy,appliedBy:$appliedBy,acceptedUser:$acceptedUser,bookmarkedBy:$bookmarkedBy';
  }
}
