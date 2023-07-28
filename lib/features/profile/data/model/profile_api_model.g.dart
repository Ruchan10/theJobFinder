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
      phoneNum: json['phoneNum'] as String?,
      cv: json['cv'] as String?,
      profile: json['profile'] as String?,
    );

Map<String, dynamic> _$ProfileApiModelToJson(ProfileApiModel instance) =>
    <String, dynamic>{
      '_id': instance.profileId,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNum': instance.phoneNum,
      'cv': instance.cv,
      'profile': instance.profile,
    };
