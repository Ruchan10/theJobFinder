import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/company_card.dart';
import '../../../applications/presentation/widget/get_applied_jobs_widget.dart';
import '../../../search/domain/entity/job_entity.dart';

class HomeJobWidget extends ConsumerWidget {
  final WidgetRef ref;
  final List<JobEntity> jobList;

  const HomeJobWidget({
    super.key,
    required this.ref,
    required this.jobList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserIdAsyncValue = ref.watch(currentUserIdProvider);
    return currentUserIdAsyncValue.when(
      data: (currentUserId) {
        return ListView.builder(
          itemCount: jobList.length,
          itemBuilder: (context, index) {
            bool isBookmarked = false;
            if (currentUserId != null &&
                jobList[index].bookmarkedBy!.contains(currentUserId)) {
              isBookmarked = true;
            }
            return Card(
              child: getCompanyCard(
                context: context,
                name: jobList[index].company,
                job: jobList[index].title,
                salary: jobList[index].salary,
                logo: jobList[index].logo,
                location: jobList[index].location,
                time: jobList[index].desc,
                ref: ref,
                list: jobList,
                index: index,
                bookmarked: isBookmarked,
                fromBookmark: false,
              ),
            );
          },
        );
      },
      loading: () =>
          const CircularProgressIndicator(), // You can show a loading indicator
      error: (error, stack) {
        // You can handle the error state here
        print('Error fetching currentUserId: $error');
        return const Text('Error fetching data');
      },
    );
  }
}
