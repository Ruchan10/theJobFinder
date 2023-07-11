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
    );

Map<String, dynamic> _$JobApiModelToJson(JobApiModel instance) =>
    <String, dynamic>{
      '_id': instance.jobId,
      'title': instance.title,
      'desc': instance.desc,
      'company': instance.company,
      'location': instance.location,
    };
