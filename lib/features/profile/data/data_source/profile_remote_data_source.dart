import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../domain/entity/profile_entity.dart';
import '../dto/update_profile.dart';
import '../model/profile_api_model.dart';

final profileRemoteDataSourceProvider = Provider(
  (ref) => ProfileRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    profileApiModel: ref.read(profileApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    // authApiModel: ref.read(authApiModelProvider),
  ),
);

class ProfileRemoteDataSource {
  final Dio dio;
  final ProfileApiModel profileApiModel;
  // final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  ProfileRemoteDataSource({
    required this.dio,
    required this.profileApiModel,
    // required this.authApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile) async {
    try {
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      FormData formData = FormData.fromMap({
        'fullName': profile.fullName,
        'phoneNumber': profile.phoneNumber,
        'cv': await MultipartFile.fromFile(profile.cv!),
        'profile': await MultipartFile.fromFile(profile.profile!),
      });
      var response = await dio.post(ApiEndpoints.updateProfile,
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

  Future<Either<Failure, List<ProfileEntity>>> getApplicants(
      String userId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      
      var response = await dio.get(
        ApiEndpoints.getUserDetails + userId,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        print("in get APPLICANTS");
        List<ProfileEntity> profile = [];

        GetAllProfileDTO profileAddDTO =
            GetAllProfileDTO.fromJson(response.data);
        profile = profileApiModel.toEntityList(profileAddDTO.data);
        print(profile);
        return Right(profile);
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

  Future<Either<Failure, List<ProfileEntity>>> getUserDetails() async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      String? userId;
      var data0 = await userSharedPrefs.getUserId();
      data0.fold(
        (l) => userId = null,
        (r) => userId = r!,
      );

      var response = await dio.get(
        ApiEndpoints.getUserDetails + userId!,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<ProfileEntity> profile = [];

        GetAllProfileDTO profileAddDTO =
            GetAllProfileDTO.fromJson(response.data);
        profile = profileApiModel.toEntityList(profileAddDTO.data);
        return Right(profile);
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

