import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../domain/entity/job_entity.dart';
import '../dto/get_all_jobs.dart';
import '../model/job_api_model.dart';

final jobRemoteDataSourceProvider = Provider(
  (ref) => JobRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    jobApiModel: ref.read(jobApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    // authApiModel: ref.read(authApiModelProvider),
  ),
);

class JobRemoteDataSource {
  final Dio dio;
  final JobApiModel jobApiModel;
  // final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  JobRemoteDataSource({
    required this.dio,
    required this.jobApiModel,
    // required this.authApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addJob(JobEntity job) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createJob,
        data: jobApiModel.fromEntity(job).toJson(),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<JobEntity>>> getAllJobs() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllJobs);
      if (response.statusCode == 200) {
        List<JobEntity> jobs = [];

        GetAllJobDTO jobAddDTO = GetAllJobDTO.fromJson(response.data);
        jobs = jobApiModel.toEntityList(jobAddDTO.data);
        return Right(jobs);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // Get all students by jobId
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByJob(
  //     String jobId) async {
  //   try {
  //     // get token
  //     String? token;
  //     await userSharedPrefs
  //         .getUserToken()
  //         .then((value) => value.fold((l) => null, (r) => token = r!));

  //     var response = await dio.get(ApiEndpoints.getStudentsByJob + jobId,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token',
  //           },
  //         ));
  //     if (response.statusCode == 201) {
  //       GetAllStudentsByJobDTO getAllStudentDTO =
  //           GetAllStudentsByJobDTO.fromJson(response.data);

  //       return Right(authApiModel.listFromJson(getAllStudentDTO.data));
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.statusMessage.toString(),
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.error.toString(),
  //       ),
  //     );
  //   }
  // }
}



//  // 1st way

