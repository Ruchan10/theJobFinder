import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/bookmark_entity.dart';

class LoadBookmark extends StatelessWidget {
  final WidgetRef ref;
  final List<BookmarkEntity> lstBookmark;
  const LoadBookmark({super.key, required this.lstBookmark, required this.ref});

  @override
  Widget build(BuildContext context) {
    print("LIST BOOKMARKS");
    print(lstBookmark);
    return ListView.builder(
      itemCount: lstBookmark.length,
      itemBuilder: ((context, index) => ListTile(
            title: Text(lstBookmark[index].title),
            subtitle: Text(lstBookmark[index].company),
          )),
    );
  }
}
