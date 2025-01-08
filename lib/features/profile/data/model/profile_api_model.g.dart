// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileApiModel _$ProfileApiModelFromJson(Map<String, dynamic> json) =>
    ProfileApiModel(
      profileId: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      appliedJobs: (json['appliedJobs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bookmarkedJobs: (json['bookmarkedJobs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      cv: json['cv'] as String?,
      profile: json['profile'] as String?,
    );

Map<String, dynamic> _$ProfileApiModelToJson(ProfileApiModel instance) =>
    <String, dynamic>{
      '_id': instance.profileId,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'cv': instance.cv,
      'profile': instance.profile,
      'password': instance.password,
      'bookmarkedJobs': instance.bookmarkedJobs,
      'appliedJobs': instance.appliedJobs,
    };
