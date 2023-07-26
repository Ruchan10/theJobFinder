import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/bookmark_entity.dart';
import '../../domain/repository/bookmark_repo.dart';
import '../data_source/bookmark_local_data_source.dart';

final bookmarkLocalRepoProvider = Provider<IBookmarkRepository>((ref) {
  return BookmarkLocalRepositoryImpl(
    bookmarkLocalDataSource: ref.read(bookmarkLocalDataSourceProvider),
  );
});

class BookmarkLocalRepositoryImpl implements IBookmarkRepository {
  final BookmarkLocalDataSource bookmarkLocalDataSource;

  BookmarkLocalRepositoryImpl({
    required this.bookmarkLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> addBookmark(BookmarkEntity bookmark) {
    return bookmarkLocalDataSource.addBookmark(bookmark);
  }

  @override
  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarks() {
    return bookmarkLocalDataSource.getAllBookmarks();
  }
  
  @override
  Future<Either<Failure, bool>> removeBookmark(String id) {
    // TODO: implement removeBookmark
    throw UnimplementedError();
  }

}
