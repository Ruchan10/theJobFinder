// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkApiModel _$BookmarkApiModelFromJson(Map<String, dynamic> json) =>
    BookmarkApiModel(
      bookmarkId: json['_id'] as String?,
      title: json['title'] as String,
      desc: json['desc'] as String,
      company: json['company'] as String,
      salary: json['salary'] as String,
      jobTime: json['jobTime'] as String,
      location: json['location'] as String,
      logo: json['logo'] as String,
      postedBy: json['postedBy'] as String,
      bookmarkedBy: (json['bookmarkedBy'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      appliedBy:
          (json['appliedBy'] as List<dynamic>).map((e) => e as String).toList(),
      acceptedUser: (json['acceptedUser'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookmarkApiModelToJson(BookmarkApiModel instance) =>
    <String, dynamic>{
      '_id': instance.bookmarkId,
      'title': instance.title,
      'desc': instance.desc,
      'company': instance.company,
      'location': instance.location,
      'logo': instance.logo,
      'postedBy': instance.postedBy,
      'salary': instance.salary,
      'jobTime': instance.jobTime,
      'bookmarkedBy': instance.bookmarkedBy,
      'appliedBy': instance.appliedBy,
      'acceptedUser': instance.acceptedUser,
    };
