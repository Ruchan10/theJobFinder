import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../search/domain/entity/job_entity.dart';

class LoadJob extends StatelessWidget {
  final WidgetRef ref;
  final List<JobEntity> lstJobs;
  const LoadJob({super.key, required this.lstJobs, required this.ref});

  @override
  Widget build(BuildContext context) {
    print(lstJobs.length);
    print("INSIDE LoadJob Function");
    return ListView.builder(
      itemCount: lstJobs.length,
      itemBuilder: ((context, index) => ListTile(
          title: Text(lstJobs[index].title),
          subtitle: Text(lstJobs[index].title),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                      'Are you sure you want to delete ${lstJobs[index].title}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // ref
                          //     .read(batchViewModelProvider.notifier)
                          //     .deletebatch(context, lstJobes[index]);
                        },
                        child: const Text('Yes')),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ))),
    );
  }
}
