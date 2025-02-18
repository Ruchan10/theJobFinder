import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/bookmark/domain/entity/bookmark_entity.dart';

import '../../../../bookmark/presentation/viewmodel/bookmark_view_model.dart';
import '../../../../bookmark/presentation/widget/bookmark_widget.dart';
import '../../viewmodel/noti_view_model.dart';

class BookmarkView extends ConsumerStatefulWidget {
  const BookmarkView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends ConsumerState<BookmarkView> {
  Future<void> _refreshBookmarks() async {
    await ref.read(bookmarkViewModelProvider.notifier).getAllBookmarks();
  }

  List<BookmarkEntity> getDummyJobs() {
    return [
      const BookmarkEntity(
        bookmarkId: "2",
        title: "Data Analyst",
        desc: "Analyze and interpret data to support decision-making.",
        company: "Data Solutions",
        jobTime: "Part Time",
        location: "New York, NY",
        logo: "assets/images/ds.webp",
        salary: "\$60k - \$80k",
        bookmarkedBy: ["null"],
        appliedBy: ["user2"],
        acceptedUser: ["null"],
        postedBy: 'John Doe',
      ),
      const BookmarkEntity(
        bookmarkId: "3",
        title: "UI/UX Designer",
        desc: "Design user-friendly interfaces and experiences.",
        company: "Creative Studio",
        jobTime: "Remote",
        location: "Los Angeles, CA",
        logo: "assets/images/cs.webp",
        salary: "\$70k - \$90k",
        bookmarkedBy: ["null"],
        appliedBy: ["null"],
        acceptedUser: [],
        postedBy: 'Emily Doe',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: _refreshBookmarks,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Bookmark",
                                  style: TextStyle(
                                    fontSize: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // "Notifications" and "Settings" Icons at the End
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  var notiState =
                                      ref.watch(notiViewModelProvider);
                                  // Show a dialog to display notifications
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FittedBox(
                                        child: AlertDialog(
                                          title: const Text('Notifications'),
                                          content: Column(
                                            children: [
                                              // List of notifications
                                              if (notiState.notis == null) ...{
                                                const Text('No notifications')
                                              } else ...{
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      notiState.notis!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      title: Text(notiState
                                                          .notis![index]),
                                                    );
                                                  },
                                                )
                                              },

                                              // "Clear All" button
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    ref
                                                        .read(
                                                            notiViewModelProvider
                                                                .notifier)
                                                        .clearNoti();
                                                    ref.watch(
                                                        notiViewModelProvider);
                                                  });
                                                },
                                                child: const Text('Clear All'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  // ref
                                  //     .read(notiViewModelProvider.notifier)
                                  //     .addNoti("TESTING2.",
                                  //         "64d658a7242b5e9f27d24c3b");
                                  // var notis = await notiState.getNoti();
                                },
                                icon: Stack(
                                  children: [
                                    const Icon(
                                      Icons.notifications,
                                      size: 30,
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        constraints: const BoxConstraints(
                                          minWidth: 14,
                                          minHeight: 14,
                                        ),
                                        child: const Text(
                                          '5',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      SizedBox(
                        width: width * .7,
                        child: const TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(
                                top: 20), // add padding to adjust text

                            labelText: "Search",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(
                                  1), // add padding to adjust icon
                              child: Icon(Icons.search),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                // if (bookmarkState.isLoading) ...{
                //   const CircularProgressIndicator(),
                // } else if (bookmarkState.error != null) ...{
                //   Text(bookmarkState.error!),
                // } else if (bookmarkState.bookmarks.isEmpty) ...{
                //   const Center(
                //     child: Text('No Bookmarks Found'),
                //   ),
                // } else ...{
                BookmarkWidget(ref: ref, bookmarkList: getDummyJobs()),
                // }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
