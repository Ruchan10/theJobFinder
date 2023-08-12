import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/data/repository/auth_remote_repository.dart';

import '../entity/change_email_entity.dart';
import '../entity/change_password_entity.dart';
import '../entity/user_hive_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(UserEntity user);
  Future<Either<Failure, bool>> changeEmail(ChangeEmailEntity emails);Future<Either<Failure, bool>> changePassword(ChangePasswordEntity pws);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, bool>> addNoti(String noti);
  Future<Either<Failure, List<String>>> getNoti();
  Future<Either<Failure, bool>> clearNoti();
}
