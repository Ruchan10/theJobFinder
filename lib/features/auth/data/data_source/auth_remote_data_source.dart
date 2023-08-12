import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/config/constants/api_endpoint.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/core/network/remote/http_service.dart';
import 'package:the_job_finder/core/shared_prefs/user_shared_pref.dart';
import 'package:the_job_finder/features/auth/domain/entity/user_hive_entity.dart';

import '../../domain/entity/change_email_entity.dart';
import '../../domain/entity/change_password_entity.dart';

final authRemoteDataSourceProvider = Provider((ref) => AuthRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
    ));

class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  AuthRemoteDataSource({required this.dio, required this.userSharedPrefs});

  //Upload image
  Future<Either<Failure, String>> uploadProfilePicture(
    File image,
  ) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );
      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );
      return Right(response.data["data"]);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

//Login
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        print(response);
        // retrieve token
        String token = response.data["token"];
        String userId = response.data["user"]['_id'];

        await userSharedPrefs.setUserToken(token);
        await userSharedPrefs.setUserId(userId);
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

  // register
  Future<Either<Failure, bool>> registerUser(UserEntity student) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "email": student.email,
          "password": student.password,
        },
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

  // change email
  Future<Either<Failure, bool>> changeEmail(ChangeEmailEntity emails) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.post(
        ApiEndpoints.changeEmail,
        data: {
          "email": emails.email,
          "confirmEmail": emails.confirmEmail,
        },
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

  // change password

  Future<Either<Failure, bool>> changePassword(ChangePasswordEntity pws) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.post(
        ApiEndpoints.changePassword,
        data: {
          "newPassword": pws.pw,
          "reenterNewPassword": pws.cpw,
          "currentPassword": pws.currentPw,
        },
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

  // Add Notifications
  Future<Either<Failure, bool>> addNoti(String noti) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.post(
        ApiEndpoints.addNoti + noti,
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
  Future<Either<Failure, List<String>>> getNoti() async {
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
        List<String> notis;
        notis = response.data["data"];
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
        data: {
          null,
        },
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
