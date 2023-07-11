import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/widgets/company_card.dart';

import '../../domain/entity/job_entity.dart';

class JobWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<JobEntity> jobList;

  const JobWidget({
    super.key,
    required this.ref,
    required this.jobList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: jobList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2.1),
      itemBuilder: (context, index) {
        return getCompanyCard(
          context,
          jobList[index].company,
          jobList[index].title,
          jobList[index].location,
          jobList[index].desc,
        );
      },
    );
  }
}
