import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../bookmark/presentation/viewmodel/bookmark_view_model.dart';
import '../../../../bookmark/presentation/widget/bookmark_widget.dart';

class BookmarkView extends ConsumerStatefulWidget {
  const BookmarkView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends ConsumerState<BookmarkView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var bookmarkState = ref.watch(bookmarkViewModelProvider);

    return Scaffold(
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
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        const Text(
                          "Bookmark",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.notifications_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.settings_outlined),
                        ),
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
                            padding:
                                EdgeInsets.all(1), // add padding to adjust icon
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
              Flexible(
                child: BookmarkWidget(
                    ref: ref, bookmarkList: bookmarkState.bookmarks),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
