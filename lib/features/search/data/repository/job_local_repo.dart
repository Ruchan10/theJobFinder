import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/job_entity.dart';
import '../../domain/repository/job_repo.dart';
import '../data_source/job_local_data_source.dart';

final jobLocalRepoProvider = Provider<IJobRepository>((ref) {
  return JobLocalRepositoryImpl(
    jobLocalDataSource: ref.read(jobLocalDataSourceProvider),
  );
});

class JobLocalRepositoryImpl implements IJobRepository {
  final JobLocalDataSource jobLocalDataSource;

  JobLocalRepositoryImpl({
    required this.jobLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> addJob(JobEntity job) {
    return jobLocalDataSource.addJob(job);
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getAllJobs() {
    return jobLocalDataSource.getAllJobs();
  }

  // @override
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByJob(
  //     String jobId) {
  //   // TODO: implement getAllStudentsByJob
  //   throw UnimplementedError();
  // }
}
