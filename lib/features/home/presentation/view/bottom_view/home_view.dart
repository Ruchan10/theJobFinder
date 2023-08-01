import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../widgets/pill_btns_icons.dart';
import '../../../../profile/domain/entity/profile_entity.dart';
import '../../../../profile/presentation/viewmodel/profile_view_model.dart';
import '../../../../search/presentation/viewmodel/job_view_model.dart';
import '../../../../search/presentation/widget/job_widget.dart';

class homeView extends ConsumerStatefulWidget {
  const homeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _homeViewState();
}

class _homeViewState extends ConsumerState<homeView> {
  List<ProfileEntity> profile = [];
  final String apiBaseUrl = 'http://192.168.1.6:3000/';
  String? _userName;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var userState = ref.watch(profileViewModelProvider);
    profile = userState.profiles;
    _userName = profile[0].fullName;
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
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.notifications),
                          ),
                          CircleAvatar(
                            // radius: 50,
                            backgroundImage:
                                NetworkImage(apiBaseUrl + profile[0].profile!),
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
                          child: const TextField(
                            decoration: InputDecoration(
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
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white),
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
