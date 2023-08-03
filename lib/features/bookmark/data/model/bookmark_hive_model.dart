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
  @HiveField(5)
  final String logo;
  @HiveField(6)
  final String postedBy;
  @HiveField(7)
  final List<String> appliedBy;
  @HiveField(8)
  final List<String> bookmarkedBy;
  @HiveField(9)
  final List<String> acceptedUser;
  @HiveField(10)
  final String salary;
  @HiveField(11)
  final String jobTime;
  
  // empty constructor
  BookmarkHiveModel.empty()
      : this(
            bookmarkId: '',
            title: '',
            desc: '',
            location: '',
            company: '',
            jobTime: '',
            salary: '',
            logo: '',
            postedBy: '',
            appliedBy: [],
            bookmarkedBy: [],
            acceptedUser: []);

  BookmarkHiveModel({
    String? bookmarkId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,
    required this.logo,
    required this.jobTime,
    required this.postedBy,
    required this.salary,
    required this.appliedBy,
    required this.bookmarkedBy,
    required this.acceptedUser,
  }) : bookmarkId = bookmarkId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  BookmarkEntity toEntity() => BookmarkEntity(
        bookmarkId: bookmarkId,
        title: title,
        desc: desc,
        location: location,
        jobTime: jobTime,
        company: company,
        logo: logo,
        salary: salary,
        postedBy: postedBy,
        appliedBy: appliedBy,
        acceptedUser: acceptedUser,
        bookmarkedBy: bookmarkedBy,
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
        salary: entity.salary,
        jobTime: entity.jobTime,
        location: entity.location,
        logo: entity.logo,
        postedBy: entity.postedBy,
        appliedBy: entity.appliedBy,
        acceptedUser: entity.acceptedUser,
        bookmarkedBy: entity.bookmarkedBy,
      );

  List<BookmarkHiveModel> toHiveModelList(List<BookmarkEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'bookmarkId: $bookmarkId,  title: $title, desc:$desc, company:$company,salary:$salary, location:$location,postedBy:$postedBy,jobTime:$jobTime,appliedBy:$appliedBy,acceptedUser:$acceptedUser,bookmarkedBy:$bookmarkedBy';
  }
}
