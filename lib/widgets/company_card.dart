import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/applications/presentation/viewmodel/delete_job_view_model.dart';

import '../features/applications/presentation/viewmodel/received_view_model.dart';
import '../features/bookmark/presentation/viewmodel/bookmark_view_model.dart';
import '../features/search/presentation/viewmodel/job_view_model.dart';
import 'job_details.dart';

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
  required String salary,
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
  return GestureDetector(
    onTap: () {
      showJobModal(context, list[index], ref);
    },
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
                        : const AssetImage('assets/images/logoPlaceholder.png')
                            as ImageProvider,
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                if (!bookmarked) {
                  ref
                      .read(jobViewModelProvider.notifier)
                      .addBookmark(context, list[index]);
                  await ref
                      .read(bookmarkViewModelProvider.notifier)
                      .getAllBookmarks();
                } else {
                  if (fromBookmark) {
                    ref
                        .read(bookmarkViewModelProvider.notifier)
                        .removeBookmark(context, list[index]);
                    await ref
                        .read(bookmarkViewModelProvider.notifier)
                        .getAllBookmarks();
                  } else {
                    ref
                        .read(jobViewModelProvider.notifier)
                        .removeBookmark(context, list[index]);
                    await ref
                        .read(bookmarkViewModelProvider.notifier)
                        .getAllBookmarks();
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
        Expanded(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.attach_money),
              ),
              Text(salary),
            ],
          ),
        )
      ],
    ),
  );
}

Widget getCreatedCard({
  required BuildContext context,
  required String name,
  required String job,
  required String location,
  required String logo,
  required String salary,
  required String time,
  required WidgetRef ref,
  required int index,
  required list,
}) {
  void showDeleteModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return the widget that will be the content of the dialog
        return Expanded(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delete Job $job !!!'),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            content: const Column(
              children: [
                Text("Are you sure you want to delete?"),
                SizedBox(height: 8),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the modal when this button is pressed
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  ref
                      .read(applicationViewModelProvider.notifier)
                      .deleteJob(context, list[index]);
                  ref.watch(createdViewModelProvider);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
    );
  }

  return GestureDetector(
    onTap: () {
      showCreatedJobModal(context, list[index], ref);
    },
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
                    "   $name",
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              "      $job",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.location_on),
              ),
              Text(location),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.timer),
              ),
              Text(time),
            ],
          ),
        ),
        // Expanded(
        //   child: Row(
        //     children: [
        //       IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.attach_money),
        //       ),
        //       Text(salary),
        //     ],
        //   ),
        // ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDeleteModal(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text("Delete"),
              ),
            ],
          ),
        ),
      ],
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
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.apple_outlined),
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.bookmark),
              ),
            ],
          ),
          Text(
            "   $job",
            style: const TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.location_on),
              ),
              Text(location),
            ],
          ),
        ],
      ),
    ),
  );
}
