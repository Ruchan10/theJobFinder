import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/config/constants/api_endpoint.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/core/network/remote/http_service.dart';
import 'package:the_job_finder/core/shared_prefs/user_shared_pref.dart';

final notiRemoteDataSourceProvider = Provider((ref) => NotiRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
    ));

class NotiRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  NotiRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure, bool>> addNoti(String noti, String userId) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.post(
        '${ApiEndpoints.addNoti}/$noti/$userId',
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
      return Left(Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ));
    }
  }

  // Get Notifications
  Future<Either<Failure, List<dynamic>>> getNoti() async {
    print("in getNoti");
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.get(
        ApiEndpoints.getNoti,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        print("In REMOTE DATA SOURCEe");
        List<dynamic> notis;
        notis = response.data["data"] as List<dynamic>;
        print(notis);

        return Right(notis);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ));
    }
  }

  // Clear Notifications
  Future<Either<Failure, bool>> clearNoti() async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.post(
        ApiEndpoints.clearNoti,
        data: {},
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
      return Left(Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ));
    }
  }
}
