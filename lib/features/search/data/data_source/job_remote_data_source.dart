import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../../profile/data/model/profile_api_model.dart';
import '../../domain/entity/job_entity.dart';
import '../dto/get_all_jobs.dart';
import '../model/job_api_model.dart';

final jobRemoteDataSourceProvider = Provider(
  (ref) => JobRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    jobApiModel: ref.read(jobApiModelProvider),
    profileApiModel: ref.read(profileApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    // authApiModel: ref.read(authApiModelProvider),
  ),
);

class JobRemoteDataSource {
  final Dio dio;
  final JobApiModel jobApiModel;
  final ProfileApiModel profileApiModel;
  // final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  JobRemoteDataSource({
    required this.dio,
    required this.jobApiModel,
    required this.profileApiModel,
    // required this.authApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addJob(JobEntity job) async {
    print("IN addJob Function");
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));
      FormData formData = FormData.fromMap({
        'title': job.title,
        'desc': job.desc,
        'jobTime': job.jobTime,
        'location': job.location,
        'salary': job.salary,
        'company': job.company,
        'logo': await MultipartFile.fromFile(job.logo),
      });

      var response = await dio.post(ApiEndpoints.createJob,
          data: formData,
          options: Options(
            headers: {
              'Authorization': '$token',
            },
          ));

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
        print("In get all jobs");
        print(response.data);
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

  Future<Either<Failure, bool>> rejectApplicant(
      String jobId, String userId) async {
    try {
      Response response = await dio.post(
        '${ApiEndpoints.rejectApplicant}$jobId/$userId',
      );
      if (response.statusCode == 200) {
        return const Right(true);
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

  Future<Either<Failure, bool>> acceptApplicant(
      String jobId, String userId) async {
    try {
      Response response = await dio.post(
        '${ApiEndpoints.acceptApplicant}$jobId/$userId',
      );
      if (response.statusCode == 200) {
        return const Right(true);
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

  Future<Either<Failure, bool>> removeBookmark(String jobId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.removeBookmark + jobId,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
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

  Future<Either<Failure, bool>> withdrawJob(String jobId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.post(
        ApiEndpoints.withdrawJob + jobId,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
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

  Future<Either<Failure, bool>> addBookmark(String jobId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.post(
        ApiEndpoints.addBookmark + jobId,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
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

  Future<Either<Failure, List<JobEntity>>> searchQuery(
      String searchQuery) async {
    try {
      // Get the token from shared prefs

      Response response =
          await dio.post(ApiEndpoints.searchQuery + searchQuery);
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

  Future<Either<Failure, bool>> applyJob(String jobId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.post(
        ApiEndpoints.applyJob + jobId,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
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

  Future<Either<Failure, List<JobEntity>>> getApplied() async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      var response = await dio.get(
        ApiEndpoints.getApplied,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
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

  Future<Either<Failure, List<JobEntity>>> getCreated() async {
    try {
      String? userId;
      var data = await userSharedPrefs.getUserId();
      data.fold(
        (l) => userId = null,
        (r) => userId = r!,
      );
      String? token;
      var data0 = await userSharedPrefs.getUserToken();
      data0.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      var response = await dio.get(
        ApiEndpoints.getCreated + userId!,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
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
}



//  // 1st way

