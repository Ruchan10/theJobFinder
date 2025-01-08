// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_bookmarks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookmarkDTO _$GetAllBookmarkDTOFromJson(Map<String, dynamic> json) =>
    GetAllBookmarkDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => BookmarkApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBookmarkDTOToJson(GetAllBookmarkDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
