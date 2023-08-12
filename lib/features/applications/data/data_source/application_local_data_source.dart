// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/failure/failure.dart';
// import '../../../../core/network/local/hive_service.dart';
// import '../../../search/data/model/job_hive_model.dart';
// import '../../../search/domain/entity/job_entity.dart';

// // Dependency Injection using Riverpod
// final applicationLocalDataSourceProvider = Provider<ApplicationLocalDataSource>((ref) {
//   return ApplicationLocalDataSource(
//       hiveService: ref.read(hiveServiceProvider),
//       jobHiveModel: ref.read(JobHiveModelProvider));
// });

// class ApplicationLocalDataSource {
//   final HiveService hiveService;
//   final JobHiveModel jobHiveModel;

//   ApplicationLocalDataSource({
//     required this.hiveService,
//     required this.jobHiveModel,
//   });

//   // Add Application
//   Future<Either<Failure, bool>> deleteJob(JobEntity application) async {
//     try {
//       // Convert Entity to Hive Object
//       final hiveApplication = jobHiveModel.toHiveModel(application);
//       // Add to Hive
//       await hiveService.deleteJob(hiveApplication);
//       return const Right(true);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }



// }
