import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../../../widgets/company_card.dart';
import '../../../search/domain/entity/job_entity.dart';

final currentUserIdProvider = FutureProvider<String?>((ref) async {
  final userSharedPrefs = ref.read(userSharedPrefsProvider);
  final result = await userSharedPrefs.getUserId();
  return result.fold(
    (failure) {
      // Handle failure here (if needed)
      return null;
    },
    (userId) => userId,
  );
});

class GetAppliedWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<JobEntity> jobList;

  const GetAppliedWidget({
    super.key,
    required this.ref,
    required this.jobList,
  });

  @override
  Widget build(BuildContext context) {
    final currentUserIdAsyncValue = ref.watch(currentUserIdProvider);
    return currentUserIdAsyncValue.when(
      data: (currentUserId) {
        return GridView.builder(
          // Put this otherwise it will take all the space
          shrinkWrap: true,
          itemCount: jobList.length,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 2.1),
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
                location: jobList[index].location,
                logo: jobList[index].logo,
                time: jobList[index].jobTime,
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
