import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/job_entity.dart';

class LoadJob extends StatelessWidget {
  final WidgetRef ref;
  final List<JobEntity> lstJobs;
  const LoadJob({super.key, required this.lstJobs, required this.ref});

  @override
  Widget build(BuildContext context) {
    print("IN LOAD JOB");
    print(lstJobs);
    return ListView.builder(
      itemCount: lstJobs.length,
      itemBuilder: ((context, index) => ListTile(
            title: Text(lstJobs[index].title),
            subtitle: Text(lstJobs[index].location),
            trailing: Text(lstJobs[index].company),
          )),
    );
  }
}
