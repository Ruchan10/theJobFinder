import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/job_local_repo.dart';
import '../../data/repository/job_remote_repo.dart';
import '../entity/job_entity.dart';

final jobRepositoryProvider = Provider<IJobRepository>(
  (ref) {
    // // Check for the internet
    // final internetStatus = ref.watch(connectivityStatusProvider);
    // print("INTERNET-----------");
    // print(internetStatus);
    // return ref.watch(jobRemoteRepoProvider);

    if (true) {
      print("INTERNET ACCESS");
      // If internet is available then return remote repo
      return ref.watch(jobRemoteRepoProvider);
    } else {
      print("NO INTERNET ACCESS");
      // If internet is not available then return local repo
      return ref.watch(jobLocalRepoProvider);
    }
  },
);

abstract class IJobRepository {
  Future<Either<Failure, List<JobEntity>>> getAllJobs();
  Future<Either<Failure, List<JobEntity>>> getCreated();
  Future<Either<Failure, List<JobEntity>>> getApplied();
  Future<Either<Failure, bool>> addJob(JobEntity job);
  Future<Either<Failure, bool>> acceptApplicant(String jobId, String userId);
  Future<Either<Failure, bool>> rejectApplicant(String jobId, String userId);
  Future<Either<Failure, bool>> removeBookmark(String id);
  Future<Either<Failure, bool>> withdrawJob(String id);
  Future<Either<Failure, bool>> addBookmark(String id);
  Future<Either<Failure, bool>> applyJob(String id);
  Future<Either<Failure, List<JobEntity>>> searchQuery(String searchQuery);
}
