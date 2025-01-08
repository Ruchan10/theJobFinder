import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/job_entity.dart';
import '../repository/job_repo.dart';

final jobUsecaseProvider = Provider<JobUseCase>(
  (ref) => JobUseCase(
    jobRepository: ref.watch(jobRepositoryProvider),
  ),
);

class JobUseCase {
  final IJobRepository jobRepository;

  JobUseCase({required this.jobRepository});

  Future<Either<Failure, List<JobEntity>>> getAllJobs() {
    return jobRepository.getAllJobs();
  }

  Future<Either<Failure, List<JobEntity>>> getCreated() {
    return jobRepository.getCreated();
  }

  Future<Either<Failure, List<JobEntity>>> getApplied() {
    return jobRepository.getApplied();
  }


  Future<Either<Failure, bool>> addJob(JobEntity job) {
    return jobRepository.addJob(job);
  }

  Future<Either<Failure, bool>> acceptApplicant(String jobId, String userId) {
    return jobRepository.acceptApplicant(jobId, userId);
  }

  Future<Either<Failure, bool>> rejectApplicant(String jobId, String userId) {
    return jobRepository.rejectApplicant(jobId, userId);
  }

  Future<Either<Failure, bool>> removeBookmark(String id) async {
    return jobRepository.removeBookmark(id);
  }

  Future<Either<Failure, bool>> withdrawJob(String id) async {
    return jobRepository.withdrawJob(id);
  }

  Future<Either<Failure, bool>> addBookmark(String id) async {
    return jobRepository.addBookmark(id);
  }

  Future<Either<Failure, bool>> applyJob(String id) async {
    return jobRepository.applyJob(id);
  }

  Future<Either<Failure, List<JobEntity>>> searchQuery(
      String searchQuery) async {
    return jobRepository.searchQuery(searchQuery);
  }
}
