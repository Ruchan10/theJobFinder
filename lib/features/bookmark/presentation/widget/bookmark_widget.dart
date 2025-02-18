import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/bookmark/domain/entity/bookmark_entity.dart';

import '../../../../widgets/company_card.dart';

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
      shrinkWrap: true,
      itemCount: bookmarkList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2.1),
      itemBuilder: (context, index) {
        return Card(
          child: getCompanyCard(
            context: context,
            name: bookmarkList[index].company,
            job: bookmarkList[index].title,
            logo: bookmarkList[index].logo,
            salary: bookmarkList[index].salary,
            location: bookmarkList[index].location,
            time: bookmarkList[index].jobTime,
            ref: ref,
            list: bookmarkList,
            index: index,
            bookmarked: true,
            fromBookmark: true,
          ),
        );
      },
    );
  }
}
