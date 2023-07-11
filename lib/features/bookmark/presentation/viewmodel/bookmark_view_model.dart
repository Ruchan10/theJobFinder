import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../domain/entity/bookmark_entity.dart';
import '../../domain/use_case/bookmark_use_case.dart';
import '../state/bookmark_state.dart';

final bookmarkViewModelProvider =
    StateNotifierProvider<BookmarkViewModel, BookmarkState>(
  (ref) {
    return BookmarkViewModel(ref.read(bookmarkUsecaseProvider));
  },
);

class BookmarkViewModel extends StateNotifier<BookmarkState> {
  final BookmarkUseCase bookmarkUseCase;

  BookmarkViewModel(this.bookmarkUseCase) : super(BookmarkState.initial()) {
    getAllBookmarks();
  }

  addBookmark(BookmarkEntity bookmark) async {
    state.copyWith(isLoading: true);
    var data = await bookmarkUseCase.addBookmark(bookmark);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllBookmarks() async {
    state = state.copyWith(isLoading: true);
    var data = await bookmarkUseCase.getAllBookmarks();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, bookmarks: r),
    );
  }
}
