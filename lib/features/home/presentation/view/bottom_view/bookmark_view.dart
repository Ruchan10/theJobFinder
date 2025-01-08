import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var bookmarkState = ref.watch(bookmarkViewModelProvider);

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
                          // Centered "Search" Text
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
                                  print("IN HOME");
                                  // print(notis[0]);
                                },
                                icon: const Icon(Icons.notifications_outlined),
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
                if (bookmarkState.isLoading) ...{
                  const CircularProgressIndicator(),
                } else if (bookmarkState.error != null) ...{
                  Text(bookmarkState.error!),
                } else if (bookmarkState.bookmarks.isEmpty) ...{
                  const Center(
                    child: Text('No Bookmarks Found'),
                  ),
                } else ...{
                  BookmarkWidget(
                      ref: ref, bookmarkList: bookmarkState.bookmarks),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
