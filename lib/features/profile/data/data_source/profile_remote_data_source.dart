import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../domain/entity/profile_entity.dart';
import '../dto/get_all_profiles.dart';
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
      var response = await dio.post(
        ApiEndpoints.createProfile,
        data: profileApiModel.fromEntity(profile).toJson(),
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
}



//  // 1st way

