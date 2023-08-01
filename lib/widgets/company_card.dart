import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/search_view.dart';

import '../features/bookmark/presentation/viewmodel/bookmark_view_model.dart';
import '../features/search/presentation/viewmodel/job_view_model.dart';

bool isBookmarkIcon(IconData? icon) {
  return icon == Icons.bookmark || icon == Icons.bookmark_outline;
}

const String apiBaseUrl = 'http://192.168.1.6:3000/';

Widget getCompanyCard({
  required BuildContext context,
  required String name,
  required String job,
  required String location,
  required String logo,
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
  return Container(
    // decoration: BoxDecoration(
    //   border: Border.all(color: Colors.black12),
    //   shape: BoxShape.rectangle,
    //   color: Colors.white,
    //   borderRadius: const BorderRadius.all(
    //     Radius.circular(50),
    //   ),
    // ),
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
                    CircleAvatar(
                      // radius: 50,
                      backgroundImage: logo.isNotEmpty
                          ? NetworkImage(apiBaseUrl + logo)
                          : const AssetImage('') as ImageProvider,
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
                    if (fromBookmark) {
                      ref
                          .read(bookmarkViewModelProvider.notifier)
                          .removeBookmark(context, list[index]);
                    } else {
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
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "   $job",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                ),
                Text(location),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.timer),
                ),
                Text(time),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getCompanyCardSmall(
    {required BuildContext context,
    required String name,
    required String job,
    required String location}) {
  return Container(
    alignment: Alignment.centerLeft,
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
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the left
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark),
              ),
            ],
          ),
          Text(
            "   $job",
            style: const TextStyle(fontSize: 20),
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
  );
}
