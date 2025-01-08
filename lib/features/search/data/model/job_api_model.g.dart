// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApiModel _$JobApiModelFromJson(Map<String, dynamic> json) => JobApiModel(
      jobId: json['_id'] as String?,
      title: json['title'] as String,
      desc: json['desc'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      jobTime: json['jobTime'] as String,
      logo: json['logo'] as String,
      salary: json['salary'] as String,
      postedBy: json['postedBy'] as String?,
      bookmarkedBy: (json['bookmarkedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      appliedBy: (json['appliedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      acceptedUser: (json['acceptedUser'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobApiModelToJson(JobApiModel instance) =>
    <String, dynamic>{
      '_id': instance.jobId,
      'title': instance.title,
      'desc': instance.desc,
      'company': instance.company,
      'location': instance.location,
      'logo': instance.logo,
      'salary': instance.salary,
      'jobTime': instance.jobTime,
      'postedBy': instance.postedBy,
      'bookmarkedBy': instance.bookmarkedBy,
      'appliedBy': instance.appliedBy,
      'acceptedUser': instance.acceptedUser,
    };
