import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/widgets/company_card.dart';

import '../../domain/entity/job_entity.dart';

class JobWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<JobEntity> jobList;

  const JobWidget({
    Key? key,
    required this.ref,
    required this.jobList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: jobList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.1,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            getCompanyCard(
              context:context,
              name:jobList[index].company,
              job:jobList[index].title,
              location:jobList[index].location,
              time:jobList[index].desc,
              ref:ref,
              list:jobList,index:index,
            ),
            const SizedBox(height: 7),
          ],
        );
      },
    );
  }
}
