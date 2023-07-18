import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/company_card.dart';
import '../../domain/entity/bookmark_entity.dart';

class BookmarkWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<BookmarkEntity> bookmarkList;

  const BookmarkWidget({
    super.key,
    required this.ref,
    required this.bookmarkList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: bookmarkList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2.1),
      itemBuilder: (context, index) {
        return Column(
          children: [
            getCompanyCard(
                context: context,
                name: bookmarkList[index].company,
                job: bookmarkList[index].title,
                location: bookmarkList[index].location,
                time: bookmarkList[index].desc,
                ref: ref,
                list: bookmarkList,
                index: index,
                icon: const Icon(Icons.bookmark)),
            const SizedBox(height: 7),
          ],
        );
      },
    );
  }
}
