
import '../../domain/entity/bookmark_entity.dart';

class BookmarkState {
  final bool isLoading;
  final List<BookmarkEntity> bookmarks;
  // final List<AuthEntity>? students;
  final String? error;

  BookmarkState({
    // this.students,
    required this.isLoading,
    required this.bookmarks,
    this.error,
  });

  factory BookmarkState.initial() {
    return BookmarkState(
      isLoading: false,
      // students: [],
      bookmarks: [],
    );
  }

  BookmarkState copyWith({
    bool? isLoading,
    List<BookmarkEntity>? bookmarks,
    // List<AuthEntity>? students,
    String? error,
  }) {
    return BookmarkState(
      isLoading: isLoading ?? this.isLoading,
      bookmarks: bookmarks ?? this.bookmarks,
      // students: students ?? this.students,
      error: error ?? this.error,
    );
  }
}
