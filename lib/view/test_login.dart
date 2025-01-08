import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/search/presentation/viewmodel/job_view_model.dart';
import '../widgets/company_card.dart';

class TestView extends ConsumerStatefulWidget {
  const TestView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestViewState();
}

class _TestViewState extends ConsumerState<TestView> {
  @override
  Widget build(BuildContext context) {
    var jobState = ref.watch(jobViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("${jobState.error}"),
              const SizedBox(height: 50),
              Text("${jobState.isLoading}"),
              const SizedBox(height: 50),
              Text("${jobState.jobs}"),
              const SizedBox(height: 50),
              // HomeJobWidget(
              //   ref: ref,
              //   jobList: jobState.jobs,
              // ),
              getCompanyCard(
                context: context,
                name: "jobList[index].company",
                job: "jobList[index].title",
                location: "jobList[index].location,",
                logo: "jobList[index].logo",
                salary: "jobList[index].salary",
                time: "jobList[index].jobTime",
                ref: ref,
                list: "jobList",
                index: 9,
                bookmarked: true,
                fromBookmark: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
