import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/bookmark_remote_repo_impl.dart';
import '../entity/bookmark_entity.dart';

final bookmarkRepositoryProvider = Provider<IBookmarkRepository>(
  (ref) {

    if (true) {
      return ref.watch(bookmarkRemoteRepoProvider);
    }
  },
);

abstract class IBookmarkRepository {
  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarks();
  Future<Either<Failure, bool>> addBookmark(BookmarkEntity bookmark);
  Future<Either<Failure, bool>> removeBookmark(String id);

  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByBookmark(
  //     String bookmarkId);
}
