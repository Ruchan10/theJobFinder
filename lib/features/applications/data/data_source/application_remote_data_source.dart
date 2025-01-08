import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../../search/data/model/job_api_model.dart';

final applicationRemoteDataSourceProvider = Provider(
  (ref) => ApplicationRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    jobApiModel: ref.read(jobApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class ApplicationRemoteDataSource {
  final Dio dio;
  final JobApiModel jobApiModel;
  final UserSharedPrefs userSharedPrefs;

  ApplicationRemoteDataSource({
    required this.dio,
    required this.jobApiModel,
    required this.userSharedPrefs,
  });

    Future<Either<Failure, bool>> deleteJob(String jobId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteJob + jobId,
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

}
