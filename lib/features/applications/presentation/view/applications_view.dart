import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/applications/presentation/viewmodel/applied_view_model.dart';

import '../viewmodel/received_view_model.dart';
import '../widget/get_applied_jobs_widget.dart';
import '../widget/get_created_jobs_widget.dart';

class ApplicationsView extends ConsumerStatefulWidget {
  const ApplicationsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ApplicationsViewState();
}

class _ApplicationsViewState extends ConsumerState<ApplicationsView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _refreshApps() async {
    await ref.read(appliedViewModelProvider.notifier).getApplied();
    await ref.read(createdViewModelProvider.notifier).getCreated();
  }

  @override
  Widget build(BuildContext context) {
    var jobState = ref.watch(appliedViewModelProvider);
    var jobState0 = ref.watch(createdViewModelProvider);
    print("in application view state");
    return RefreshIndicator(
      onRefresh: _refreshApps,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Spacer(),
                    const Text(
                      "Applications",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                TabBar(
                  controller: tabController,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Applied",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Received",
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      GetAppliedWidget(ref: ref, jobList: jobState.jobs),
                      GetCreatedWidget(ref: ref, jobList: jobState0.jobs),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
