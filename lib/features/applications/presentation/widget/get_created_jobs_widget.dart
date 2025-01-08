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

class GetCreatedWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<JobEntity> jobList;

  const GetCreatedWidget({
    super.key,
    required this.ref,
    required this.jobList,
  });

  @override
  Widget build(BuildContext context) {
    final currentUserIdAsyncValue = ref.watch(currentUserIdProvider);

    return GridView.builder(
      // Put this otherwise it will take all the space
      // shrinkWrap: true,
      itemCount: jobList.length,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2.1),
      itemBuilder: (context, index) {
        return Card(
          child: getCreatedCard(
            context: context,
            name: jobList[index].company,
            job: jobList[index].title,
            salary: jobList[index].salary,
            logo: jobList[index].logo,
            location: jobList[index].location,
            time: jobList[index].jobTime,
            ref: ref,
            list: jobList,
            index: index,
          ),
        );
      },
    );
  }
}
