import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/bookmark_entity.dart';

part 'bookmark_hive_model.g.dart';

final bookmarkHiveModelProvider = Provider(
  (ref) => BookmarkHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.bookmarkTableId)
class BookmarkHiveModel {
  @HiveField(0)
  final String bookmarkId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final String company;
  @HiveField(4)
  final String location;

  // empty constructor
  BookmarkHiveModel.empty()
      : this(bookmarkId: '', title: '', desc: '', location: '', company: '');

  BookmarkHiveModel({
    String? bookmarkId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
  }) : bookmarkId = bookmarkId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  BookmarkEntity toEntity() => BookmarkEntity(
        bookmarkId: bookmarkId,
        title: title,
        desc: desc,
        location: location,
        company: company,
      );

  // Convert Hive List to Entity List
  static List<BookmarkEntity> toEntityList(List<BookmarkHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
      
  // Convert Entity to Hive Object
  BookmarkHiveModel toHiveModel(BookmarkEntity entity) => BookmarkHiveModel(
        // bookmarkId: entity.bookmarkId,
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        location: entity.location,
      );

  List<BookmarkHiveModel> toHiveModelList(List<BookmarkEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'bookmarkId: $bookmarkId,  title: $title, desc:$desc, company:$company, location:$location';
  }
}
