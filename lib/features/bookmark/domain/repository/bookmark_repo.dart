import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/bookmark_local_repo_impl.dart';
import '../../data/repository/bookmark_remote_repo_impl.dart';
import '../entity/bookmark_entity.dart';

final bookmarkRepositoryProvider = Provider<IBookmarkRepository>(
  (ref) {
    // // Check for the internet
    // final internetStatus = ref.watch(connectivityStatusProvider);

    if (true) {
      print("Internet ACCESS");
      return ref.watch(bookmarkRemoteRepoProvider);
    } else {
      print("NO Internet ACCESS");

      // If internet is not available then return local repo
      return ref.watch(bookmarkLocalRepoProvider);
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
