import 'package:json_annotation/json_annotation.dart';

import '../model/bookmark_api_model.dart';

part 'get_all_bookmarks.g.dart';

@JsonSerializable()
class GetAllBookmarkDTO {
  final bool success;
  final int count;
  final List<BookmarkApiModel> data;

  GetAllBookmarkDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllBookmarkDTOToJson(this);

  factory GetAllBookmarkDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBookmarkDTOFromJson(json);
}


