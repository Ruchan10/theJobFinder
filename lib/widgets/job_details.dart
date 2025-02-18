import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/shared_prefs/user_shared_pref.dart';
import '../features/profile/presentation/viewmodel/applicant_view_model.dart';
import '../features/search/presentation/viewmodel/job_view_model.dart';

const String apiBaseUrl = 'http://192.168.1.6:3000/';

void showJobModal(BuildContext context, dynamic jobData, WidgetRef ref) {
  final UserSharedPrefs userSharedPrefs = UserSharedPrefs();
  String? userId;

  userSharedPrefs.getUserId().then((data) {
    data.fold(
      (l) => userId = "null",
      (r) => userId = r,
    );

    bool? isApplied = jobData.appliedBy?.contains(userId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: jobData.logo.isNotEmpty
                      // ? NetworkImage(apiBaseUrl + jobData.logo)
                      ? AssetImage(jobData.logo)
                      : const AssetImage('') as ImageProvider,
                ),
              ),
              Center(
                child: Text(
                  jobData.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    jobData.company,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on),
                      ),
                      Text(jobData.location),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.timer),
                      ),
                      Text(jobData.jobTime),
                    ],
                  ),
                  Text(
                    jobData.salary,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Qualifications",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                  padding: const EdgeInsets.all(15), child: Text(jobData.desc)),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (isApplied) {
                      ref
                          .read(jobViewModelProvider.notifier)
                          .withdrawJob(context, jobData);
                      // ref.read(jobViewModelProvider.notifier).getAllJobs();
                    } else {
                      ref
                          .read(jobViewModelProvider.notifier)
                          .applyJob(context, jobData);
                      // ref.read(jobViewModelProvider.notifier).getAllJobs();
                    }
                    // ref.read(jobViewModelProvider.notifier).getAllJobs();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green.shade400, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                    minimumSize: const Size(120, 50), // Button width and height
                  ),
                  child: Text(
                    isApplied! ? 'WITHDRAW' : 'APPLY',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  });
}

void showCreatedJobModal(BuildContext context, dynamic jobData, WidgetRef ref) {
  final UserSharedPrefs userSharedPrefs = UserSharedPrefs();

  print("jobData");
  print(jobData);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: jobData.logo.isNotEmpty
                    ? NetworkImage(apiBaseUrl + jobData.logo)
                    : const AssetImage('') as ImageProvider,
              ),
            ),
            Center(
              child: Text(
                jobData.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  jobData.company,
                  style: const TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                    ),
                    Text(jobData.location),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.timer),
                    ),
                    Text(jobData.jobTime),
                  ],
                ),
                Text(
                  jobData.salary,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Qualifications",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30),
            ),
            Padding(
                padding: const EdgeInsets.all(15), child: Text(jobData.desc)),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  viewAppliedUsers(context, jobData, ref);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green.shade400, // Button text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                  minimumSize: const Size(120, 50), // Button width and height
                ),
                child: const Text(
                  'View',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void viewAppliedUsers(BuildContext context, dynamic jobData, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Applied Users',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (jobData.appliedBy.length > -1) ...{
              const Text(
                'No Applied Users',
                style: TextStyle(fontSize: 16, color: Colors.red),
              )
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: jobData.appliedBy.length,
                  itemBuilder: (context, index) {
                    print("INSIDE HERE");
                    final userId = jobData.appliedBy[index];
                    print(userId);
                    ref
                        .read(applicantViewModelProvider.notifier)
                        .getApplicants(userId);

                    var user = ref.watch(applicantViewModelProvider);

                    print("USER");
                    print(user.profiles);
                    return const ListTile(
                      title: Text("user.fullName"),
                      subtitle: Text("user.email"),
                    );
                  },
                ),
              )
            },
          ],
        ),
      );
    },
  );
}
