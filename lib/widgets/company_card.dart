import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/search_view.dart';

import '../features/bookmark/presentation/viewmodel/bookmark_view_model.dart';
import '../features/search/presentation/viewmodel/job_view_model.dart';

bool isBookmarkIcon(IconData? icon) {
  return icon == Icons.bookmark || icon == Icons.bookmark_outline;
}

Widget getCompanyCard({
  required BuildContext context,
  required String name,
  required String job,
  required String location,
  required String time,
  required WidgetRef ref,
  required int index,
  required list,
  required bool bookmarked,
  required bool fromBookmark,
}) {
  Icon bookmarkIcon;
  if (bookmarked) {
    bookmarkIcon = const Icon(Icons.bookmark);
  } else {
    bookmarkIcon = const Icon(Icons.bookmark_outline);
  }
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook_outlined),
                      ),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!bookmarked) {
                      const SearchView();
                      print("Add bookmark");
                      ref
                          .read(jobViewModelProvider.notifier)
                          .addBookmark(context, list[index]);
                    } else {
                      print("SHould be remove?");
                      if (fromBookmark) {
                        print("ITS WORKING");
                        ref
                            .read(bookmarkViewModelProvider.notifier)
                            .removeBookmark(context, list[index]);
                      } else {
                        print("ITS Not WORKING");

                        ref
                            .read(jobViewModelProvider.notifier)
                            .removeBookmark(context, list[index]);
                      }
                    }
                  },
                  icon: bookmarkIcon,
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "   $job",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                ),
                Text(location),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.timer),
                ),
                Text(time),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget getCompanyCardSmall(BuildContext context, double width, double height,
    String name, String job, String location) {
  return Container(
    width: width * .61,
    height: height * .18,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black12),
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(width: width * .03),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple_outlined),
                      ),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .07,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark),
                      ),
                      SizedBox(width: width * .03),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "   $job",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                ),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
