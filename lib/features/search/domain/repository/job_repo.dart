import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/job_remote_repo.dart';
import '../entity/job_entity.dart';

final jobRepositoryProvider = Provider<IJobRepository>(
  (ref) {
    return ref.watch(jobRemoteRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    // if (ConnectivityStatus.isConnected == internetStatus) {
    //   print("INTERNET ACCESS");
    //   // If internet is available then return remote repo
    // return ref.watch(jobRemoteRepoProvider);
    // } else {
    //   print("NO INTERNET ACCESS");

    //   // If internet is not available then return local repo
    //   return ref.watch(jobLocalRepoProvider);
    // }
  },
);

abstract class IJobRepository {
  Future<Either<Failure, List<JobEntity>>> getAllJobs();
  Future<Either<Failure, bool>> addJob(JobEntity job);
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByJob(
  //     String jobId);
}
