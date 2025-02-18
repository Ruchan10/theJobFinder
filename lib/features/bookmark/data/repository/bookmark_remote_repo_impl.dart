import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/bookmark_entity.dart';
import '../../domain/repository/bookmark_repo.dart';
import '../data_source/bookmark_remote_data_source.dart';

final bookmarkRemoteRepoProvider = Provider<IBookmarkRepository>(
  (ref) => BookmarkRemoteRepositoryImpl(
    bookmarkRemoteDataSource: ref.read(bookmarkRemoteDataSourceProvider),
  ),
);

class BookmarkRemoteRepositoryImpl implements IBookmarkRepository {
  final BookmarkRemoteDataSource bookmarkRemoteDataSource;

  BookmarkRemoteRepositoryImpl({required this.bookmarkRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addBookmark(BookmarkEntity bookmark) {
    return bookmarkRemoteDataSource.addBookmark(bookmark);
  }
  @override
  Future<Either<Failure, bool>> removeBookmark(String id) {
    return bookmarkRemoteDataSource.removeBookmark(id);
  }
  @override
  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarks() {
    return bookmarkRemoteDataSource.getAllBookmarks();
  }

}
