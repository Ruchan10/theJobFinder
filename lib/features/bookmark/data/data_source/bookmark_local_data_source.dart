// Dependency Injection using Riverpod
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../../domain/entity/bookmark_entity.dart';
import '../model/bookmark_hive_model.dart';

final bookmarkLocalDataSourceProvider =
    Provider<BookmarkLocalDataSource>((ref) {
  return BookmarkLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      bookmarkHiveModel: ref.read(bookmarkHiveModelProvider));
});

class BookmarkLocalDataSource {
  final HiveService hiveService;
  final BookmarkHiveModel bookmarkHiveModel;

  BookmarkLocalDataSource({
    required this.hiveService,
    required this.bookmarkHiveModel,
  });

  // Add Bookmark
  Future<Either<Failure, bool>> addBookmark(BookmarkEntity bookmark) async {
    try {
      final hiveBookmark = bookmarkHiveModel.toHiveModel(bookmark);
      await hiveService.addBookmark(hiveBookmark);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarks() async {
    try {
      final bookmarks = await hiveService.getAllBookmarks();
      final bookmarkEntities = BookmarkHiveModel.toEntityList(bookmarks);
      return Right(bookmarkEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
