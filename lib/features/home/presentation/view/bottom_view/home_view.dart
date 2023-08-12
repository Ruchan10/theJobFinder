import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/search_view.dart';
import 'package:the_job_finder/features/home/presentation/viewmodel/noti_view_model.dart';

import '../../../../../widgets/pill_btns_icons.dart';
import '../../../../profile/domain/entity/profile_entity.dart';
import '../../../../profile/presentation/viewmodel/profile_view_model.dart';
import '../../../../search/presentation/viewmodel/job_view_model.dart';
import '../../../../search/presentation/widget/job_widget.dart';
import '../../viewmodel/home_viewmodel.dart';

class homeView extends ConsumerStatefulWidget {
  const homeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _homeViewState();
}

class _homeViewState extends ConsumerState<homeView> {
  List<ProfileEntity> profile = [];
  final String apiBaseUrl = 'http://192.168.1.6:3000/';
  String? _userName = "User";
  String? _profileImg;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _navigateToSearchView() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SearchView(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var userState = ref.watch(profileViewModelProvider);
    profile = userState.profiles;
    // Check if profile list is not empty before accessing its elements
    if (profile.isNotEmpty) {
      _userName = profile[0].fullName;
      _profileImg = profile[0].profile;
    } else {
      _userName = "User"; // Default value when profile is empty
    }

    var jobState = ref.watch(jobViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: height * .05,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Welcome Home",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        child: Row(children: [
                          IconButton(
                            onPressed: () async {
                              var notiState = ref.watch(notiViewModelProvider);
                              // Show a dialog to display notifications
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return FittedBox(
                                    child: AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Notifications'),
                                          IconButton(
                                            icon: const Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
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
                                                  title: Text(
                                                      notiState.notis![index]),
                                                );
                                              },
                                            )
                                          },

                                          // "Clear All" button
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                ref
                                                    .read(notiViewModelProvider
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
                            icon: const Icon(Icons.notifications),
                          ),
                          CircleAvatar(
                            // radius: 50,
                            backgroundImage: _profileImg != null
                                ? NetworkImage(apiBaseUrl + profile[0].profile!)
                                : const AssetImage('assets/images/profile.jpg')
                                    as ImageProvider,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * .1,
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: Text(
                    "     $_userName",
                    style: const TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: height * .35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 143, 243, 146),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "  Quick Search",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            "You can search quickly for the job you want.",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: height * .01),
                        SizedBox(
                          width: width * .7,
                          child: Form(
                            key: _formKey,
                            child: GestureDetector(
                              onTap: () {},
                              child: TextFormField(
                                onFieldSubmitted: (value) {
                                  ref
                                      .read(homeViewModelProvider.notifier)
                                      .searchQuery(value);
                                  _navigateToSearchView();
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(
                                      top: 20), // add padding to adjust text

                                  labelText: "Search",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: 1), // add padding to adjust icon
                                    child: Icon(Icons.search),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.white),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * .04),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      getPillBtnIcon(
                        "All",
                        const Icon(Icons.all_inbox),
                        color: const Color.fromARGB(255, 184, 245, 187),
                      ),
                      SizedBox(width: width * .05),
                      getPillBtnIcon(
                        "Recents",
                        const Icon(Icons.recent_actors),
                      ),
                      SizedBox(width: width * .05),
                      getPillBtnIcon(
                        "Popular",
                        const Icon(Icons.power_input),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .05),
                JobWidget(ref: ref, jobList: jobState.jobs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
