import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../profile/domain/entity/profile_entity.dart';
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

  @override
  Future<Either<Failure, bool>> removeBookmark(String id) {
        throw UnimplementedError();

    
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getCreated() {
        return jobLocalDataSource.getCreatedJobs();

  }

  @override
  Future<Either<Failure, List<JobEntity>>> getApplied() {
       return jobLocalDataSource.getApplied();

  }

  @override
  Future<Either<Failure, bool>> addBookmark(String id) {
           throw UnimplementedError();


  }

  @override
  Future<Either<Failure, bool>> applyJob(String id) {
           throw UnimplementedError();


  }

  @override
  Future<Either<Failure, bool>> withdrawJob(String id) {
         throw UnimplementedError();


  }
  
  @override
  Future<Either<Failure, List<JobEntity>>> searchQuery(String searchQuery) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> acceptApplicant(String jobId, String userId) {
    // TODO: implement acceptApplicant
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProfileEntity>>> getApplicants(String jobId) {
    // TODO: implement getApplicants
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> rejectApplicant(String jobId, String userId) {
    // TODO: implement rejectApplicant
    throw UnimplementedError();
  }
}
