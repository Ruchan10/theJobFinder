import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/bookmark_entity.dart';

part 'bookmark_api_model.g.dart';

final bookmarkApiModelProvider = Provider<BookmarkApiModel>(
  (ref) => const BookmarkApiModel.empty(),
);

@JsonSerializable()
class BookmarkApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? bookmarkId;
  final String title;
  final String desc;
  final String company;
  final String location;

  const BookmarkApiModel({
    required this.bookmarkId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
  });
  const BookmarkApiModel.empty()
      : bookmarkId = '',
        title = '',
        desc = '',
        company = '',
        location = '';

  Map<String, dynamic> toJson() => _$BookmarkApiModelToJson(this);

  factory BookmarkApiModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkApiModelFromJson(json);

  // Convert API Object to Entity
  BookmarkEntity toEntity() => BookmarkEntity(
        bookmarkId: bookmarkId,
        title: title,
        desc: desc,
        company: company,
        location: location,
      );

  // Convert Entity to API Object
  BookmarkApiModel fromEntity(BookmarkEntity entity) => BookmarkApiModel(
        bookmarkId: entity.bookmarkId ?? '',
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        location: entity.location,
      );

  // Convert API List to Entity List
  List<BookmarkEntity> toEntityList(List<BookmarkApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // Convert Entity to Hive Object
  BookmarkApiModel toHiveModel(BookmarkEntity entity) => BookmarkApiModel(
        bookmarkId: entity.bookmarkId!,
        title: entity.title,
        desc: entity.desc,
        location: entity.location,
        company: entity.company,
      );

  List<BookmarkApiModel> toHiveModelList(List<BookmarkEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  List<Object?> get props => [bookmarkId, title, desc, location, company];
}
