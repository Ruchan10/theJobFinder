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

  @override
  Future<Either<Failure, List<JobEntity>>> getCreated() {
    return jobRemoteDataSource.getCreated();
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getApplied() {
    return jobRemoteDataSource.getApplied();
  }

 

  @override
  Future<Either<Failure, bool>> rejectApplicant(String jobId, String userId) {
    return jobRemoteDataSource.rejectApplicant(jobId, userId);
  }

  @override
  Future<Either<Failure, bool>> acceptApplicant(String jobId, String userId) {
    return jobRemoteDataSource.acceptApplicant(jobId, userId);
  }

  @override
  Future<Either<Failure, bool>> removeBookmark(String id) {
    return jobRemoteDataSource.removeBookmark(id);
  }

  @override
  Future<Either<Failure, bool>> withdrawJob(String id) {
    return jobRemoteDataSource.withdrawJob(id);
  }

  @override
  Future<Either<Failure, bool>> addBookmark(String id) {
    return jobRemoteDataSource.addBookmark(id);
  }

  @override
  Future<Either<Failure, bool>> applyJob(String id) {
    return jobRemoteDataSource.applyJob(id);
  }

  @override
  Future<Either<Failure, List<JobEntity>>> searchQuery(String searchQuery) {
    return jobRemoteDataSource.searchQuery(searchQuery);
  }


}
