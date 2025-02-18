import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/core/network/local/hive_service.dart';

import '../../domain/entity/user_hive_entity.dart';
import '../model/user_hive_model.dart';


final authLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(userHiveModelProvider),
  ),
);

class AuthLocalDataSource {
  final HiveService _hiveService;
  final UserHiveModel _authHiveModel;

  AuthLocalDataSource(this._hiveService, this._authHiveModel);

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      await _hiveService.addUser(_authHiveModel.toHiveModel(user));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginUser(
    String username,
    String password,
  ) async {
    try {
      return const Right(true);
        } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}