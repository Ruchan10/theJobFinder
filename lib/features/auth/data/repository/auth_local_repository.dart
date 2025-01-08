

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:the_job_finder/features/auth/domain/entity/change_email_entity.dart';
import 'package:the_job_finder/features/auth/domain/entity/user_hive_entity.dart';
import 'package:the_job_finder/features/auth/domain/repository/auth_repository.dart';

import '../../domain/entity/change_password_entity.dart';


final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
    ref.read(authLocalDataSourceProvider),
  );
});

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    return _authLocalDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) {
    return _authLocalDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, bool>> changeEmail(ChangeEmailEntity emails) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }  @override
  Future<Either<Failure, bool>> changePassword(ChangePasswordEntity pws) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> addNoti(String noti) {
    // TODO: implement addNoti
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> clearNoti() {
    // TODO: implement clearNoti
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<String>>> getNoti() {
    // TODO: implement getNoti
    throw UnimplementedError();
  }

}
