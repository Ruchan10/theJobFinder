import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../widgets/pillButtons.dart';
import '../../../../search/presentation/viewmodel/job_view_model.dart';
import '../../../../search/presentation/widget/job_widget.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var jobState = ref.watch(jobViewModelProvider);

    return Scaffold(
      body: SafeArea(
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
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        const Text(
                          "Search",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.filter_list_sharp),
                  ),
                  SizedBox(width: width * .04),
                  getPillBtn("All",
                      color: const Color.fromARGB(255, 184, 245, 187)),
                  SizedBox(width: width * .04),
                  getPillBtn("Part Time"),
                  SizedBox(width: width * .04),
                  getPillBtn("10-50k"),
                ],
              ),
              SizedBox(height: height * 0.02),
              Flexible(
                child: JobWidget(ref: ref, jobList: jobState.jobs),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
