import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/search/presentation/viewmodel/job_view_model.dart';

bool isBookmarkIcon(IconData? icon) {
  return icon == Icons.bookmark || icon == Icons.bookmark_outline;
}

Widget getCompanyCard(
    {required BuildContext context,
    required String name,
    required String job,
    required String location,
    required String time,
    required WidgetRef ref,
    required int index,
    required list,
    Icon icon = const Icon(Icons.bookmark_outline)}) {
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
                    if (isBookmarkIcon(icon.icon)) {
                      print(list[index].jobId);
                      ref
                          .read(jobViewModelProvider.notifier)
                          .addBookmark(context, list[index]);
                    } else {
                      print("SHould be remove?");

//  ref
                      // .read(jobViewModelProvider.notifier)
                      // .removeBookmark(context, list[index]);
                    }
                  },
                  icon: icon,
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
