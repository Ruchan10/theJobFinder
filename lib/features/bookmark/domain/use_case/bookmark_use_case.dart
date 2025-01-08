import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/bookmark_entity.dart';
import '../repository/bookmark_repo.dart';

final bookmarkUsecaseProvider = Provider<BookmarkUseCase>(
  (ref) => BookmarkUseCase(
    bookmarkRepository: ref.watch(bookmarkRepositoryProvider),
  ),
);

class BookmarkUseCase {
  final IBookmarkRepository bookmarkRepository;

  BookmarkUseCase({required this.bookmarkRepository});

  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarks() {
    return bookmarkRepository.getAllBookmarks();
  }

  Future<Either<Failure, bool>> addBookmark(BookmarkEntity bookmark) {
    return bookmarkRepository.addBookmark(bookmark);
  }
    Future<Either<Failure, bool>> removeBookmark(String id) async {
    return bookmarkRepository.removeBookmark(id);
  }
  // Future<Either<Failure, bool>> removeBookmark(BookmarkEntity bookmark) {
  //   return bookmarkRepository.removeBookmark(bookmark);
  // }
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByBookmark(String bookmarkId) {
  //   return bookmarkRepository.getAllStudentsByBookmark(bookmarkId);
  // }
}
