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
      location: json['location'] as String,
    );

Map<String, dynamic> _$BookmarkApiModelToJson(BookmarkApiModel instance) =>
    <String, dynamic>{
      '_id': instance.bookmarkId,
      'title': instance.title,
      'desc': instance.desc,
      'company': instance.company,
      'location': instance.location,
    };
