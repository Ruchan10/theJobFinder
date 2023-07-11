import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/search/domain/entity/job_entity.dart';

import '../../domain/repository/job_repo.dart';
import '../data_source/job_remote_data_source.dart';

final jobRemoteRepoProvider = Provider<IJobRepository>(
  (ref) => JobRemoteRepositoryImpl(
    jobRemoteDataSource: ref.read(jobRemoteDataSourceProvider),
  ),
);

class JobRemoteRepositoryImpl implements IJobRepository {
  final JobRemoteDataSource jobRemoteDataSource;

  JobRemoteRepositoryImpl({required this.jobRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addJob(JobEntity job) {
    return jobRemoteDataSource.addJob(job);
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getAllJobs() {
    return jobRemoteDataSource.getAllJobs();
  }



  // @override
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByJob(
  //     String jobId) {
  //   return jobRemoteDataSource.getAllStudentsByJob(jobId);
  // }
}
