import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/job_view_model.dart';
import '../widget/job_widget.dart';

class AddJobView extends ConsumerStatefulWidget {
  const AddJobView({super.key});

  @override
  ConsumerState<AddJobView> createState() => _AddJobViewState();
}

class _AddJobViewState extends ConsumerState<AddJobView> {
  final gap = const SizedBox(height: 8);
  final jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var jobState = ref.watch(jobViewModelProvider);

    print("ADD JOB VIEW:- ");
    print(jobState.jobs);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Job',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Job Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter job';
                }
                return null;
              },
            ),
            gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Job'),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Jobs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (jobState.isLoading) ...{
              const Center(child: CircularProgressIndicator()),
            } else if (jobState.error != null) ...{
              Text(jobState.error.toString()),
            } else if (jobState.jobs.isEmpty) ...{
              const Center(child: Text('No Jobes')),
            } else ...{
              Flexible(
                child: JobWidget(ref: ref, jobList: jobState.jobs),
              ),
            }
          ],
        ),
      ),
    );
  }
}
