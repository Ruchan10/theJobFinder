import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../../domain/entity/job_entity.dart';
import '../model/job_hive_model.dart';

// Dependency Injection using Riverpod
final jobLocalDataSourceProvider = Provider<JobLocalDataSource>((ref) {
  return JobLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      jobHiveModel: ref.read(jobHiveModelProvider));
});

class JobLocalDataSource {
  final HiveService hiveService;
  final JobHiveModel jobHiveModel;

  JobLocalDataSource({
    required this.hiveService,
    required this.jobHiveModel,
  });

  // Add Job
  Future<Either<Failure, bool>> addJob(JobEntity job) async {
    try {
      // Convert Entity to Hive Object
      final hiveJob = jobHiveModel.toHiveModel(job);
      // Add to Hive
      await hiveService.addJob(hiveJob);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<JobEntity>>> getAllJobs() async {
    try {
      print("In hive model");
      // Get all jobes from Hive
      final jobs = await hiveService.getAllJobs();
      // Convert Hive Object to Entity
      final jobEntities = jobHiveModel.toEntityList(jobs);
      return Right(jobEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<JobEntity>>> getApplied() async {
    try {
      // Get all applicationes from Hive
      final applications = await hiveService.getApplied();
      // Convert Hive Object to Entity
      final applicationEntities = jobHiveModel.toEntityList(applications);
      return Right(applicationEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<JobEntity>>> getCreatedJobs() async {
    try {
      // Get all applicationes from Hive
      final applications = await hiveService.getCreated();
      // Convert Hive Object to Entity
      final applicationEntities = jobHiveModel.toEntityList(applications);
      return Right(applicationEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
