import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/bookmark_entity.dart';

part 'bookmark_api_model.g.dart';

final bookmarkApiModelProvider = Provider<BookmarkApiModel>(
  (ref) => BookmarkApiModel.empty(),
);

@JsonSerializable()
class BookmarkApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? bookmarkId;
  final String title;
  final String desc;
  final String company;
  final String location;
  final String logo;
  final String postedBy;
  final String salary;
  final String jobTime;

  final List<String> bookmarkedBy;
  final List<String> appliedBy;
  final List<String> acceptedUser;

  const BookmarkApiModel({
    required this.bookmarkId,
    required this.title,
    required this.desc,
    required this.company,
    required this.salary,
    required this.jobTime,
    required this.location,
    required this.logo,
    required this.postedBy,
    required this.bookmarkedBy,
    required this.appliedBy,
    required this.acceptedUser,
  });
  BookmarkApiModel.empty()
      : bookmarkId = '',
        title = '',
        desc = '',
        company = '',
        logo = '',
        jobTime = '',
        salary = '',
        postedBy = '',
        bookmarkedBy = [],
        appliedBy = [],
        acceptedUser = [],
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
        jobTime: jobTime,
        location: location,
        salary: salary,
        logo: logo,
        postedBy: postedBy,
        bookmarkedBy: bookmarkedBy,
        appliedBy: appliedBy,
        acceptedUser: acceptedUser,
      );

  // Convert Entity to API Object
  BookmarkApiModel fromEntity(BookmarkEntity entity) => BookmarkApiModel(
        bookmarkId: entity.bookmarkId ?? '',
        title: entity.title,
        desc: entity.desc,
        company: entity.company,
        jobTime: entity.jobTime,
        location: entity.location,
        salary: entity.salary,
        logo: entity.logo,
        postedBy: entity.postedBy,
        bookmarkedBy: entity.bookmarkedBy,
        appliedBy: entity.appliedBy,
        acceptedUser: entity.acceptedUser,
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
        salary: entity.salary,
        company: entity.company,
        logo: entity.logo,
        jobTime: entity.jobTime,
        postedBy: entity.postedBy,
        bookmarkedBy: entity.bookmarkedBy,
        appliedBy: entity.appliedBy,
        acceptedUser: entity.acceptedUser,
      );

  List<BookmarkApiModel> toHiveModelList(List<BookmarkEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  List<Object?> get props => [
        bookmarkId,
        title,
        desc,
        location,
        salary,
        jobTime,
        company,
        postedBy,
        logo,
        acceptedUser,
        appliedBy,
        bookmarkedBy
      ];
}
