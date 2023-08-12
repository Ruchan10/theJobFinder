import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/home/presentation/viewmodel/home_viewmodel.dart';

import '../../../../search/presentation/viewmodel/job_view_model.dart';
import '../../../../search/presentation/widget/job_widget.dart';
import '../../viewmodel/noti_view_model.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  Future<void> _refreshJobs() async {
    await ref.read(jobViewModelProvider.notifier).getAllJobs();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var jobState = ref.watch(jobViewModelProvider);
    var searchState = ref.watch(homeViewModelProvider);

    return RefreshIndicator(
      onRefresh: _refreshJobs,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    // height: height * .15,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // IconButton(
                            //   onPressed: () {
                            //     setState(() {});
                            //   },
                            //   icon: const Icon(Icons.arrow_back),
                            // ),
                            const Spacer(),
                            const Text(
                              "Search",
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                            const Spacer(),
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
                                                itemBuilder: (context, index) {
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
                        ),
                        SizedBox(height: height * 0.03),
                        SizedBox(
                          width: width * .7,
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                ref
                                    .read(homeViewModelProvider.notifier)
                                    .searchQuery(value);
                              },
                              decoration: const InputDecoration(
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
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {
                  //         setState(() {});
                  //       },
                  //       icon: const Icon(Icons.filter_list_sharp),
                  //     ),
                  //     SizedBox(width: width * .04),
                  //     getPillBtn("All",
                  //         color: const Color.fromARGB(255, 184, 245, 187)),
                  //     SizedBox(width: width * .04),
                  //     getPillBtn("Part Time"),
                  //     SizedBox(width: width * .04),
                  //     getPillBtn("10-50k"),
                  //   ],
                  // ),
                  SizedBox(height: height * 0.02),
                  // Expanded(
                  //   child: ListView(
                  //     physics: const ClampingScrollPhysics(),
                  //     children: [
                  //       JobWidget(ref: ref, jobList: jobState.jobs),
                  //       // SizedBox(height: height * 0.20),
                  //     ],
                  //   ),
                  // ),
                  if (jobState.isLoading) ...{
                    const CircularProgressIndicator(),
                  } else if (searchState.jobs.isNotEmpty) ...{
                    JobWidget(ref: ref, jobList: searchState.jobs),
                  } else if (jobState.error != null) ...{
                    Text(jobState.error!),
                  } else if (jobState.jobs.isEmpty) ...{
                    const Center(
                      child: Text('No Jobs Found'),
                    ),
                  } else ...{
                    JobWidget(ref: ref, jobList: jobState.jobs),
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
