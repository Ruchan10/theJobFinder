import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/bookmark_view_model.dart';
import '../widget/load_bookmark.dart';

class AddBookmarkView extends ConsumerStatefulWidget {
  const AddBookmarkView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddBookmarkViewState();
}

class _AddBookmarkViewState extends ConsumerState<AddBookmarkView> {
  final bookmarkController = TextEditingController();
  var gap = const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    var bookmarkState = ref.watch(bookmarkViewModelProvider);
    print("BOOKMARK STATE");
    print(bookmarkState.bookmarks);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Bookmark',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: bookmarkController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Bookmark Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter bookmark name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Bookmark'),
              ),
            ),
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Bookmarks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            if (bookmarkState.isLoading) ...{
              const CircularProgressIndicator(),
            } else if (bookmarkState.error != null) ...{
              Text(bookmarkState.error!),
            } else if (bookmarkState.bookmarks.isNotEmpty) ...{
              Expanded(
                child: LoadBookmark(
                  lstBookmark: bookmarkState.bookmarks,
                  ref: ref,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
