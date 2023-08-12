import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/domain/repository/auth_repository.dart';

import '../entity/change_email_entity.dart';
import '../entity/change_password_entity.dart';
import '../entity/user_hive_entity.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(
    ref.read(authRepositoryProvider),
  );
});

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    return await _authRepository.registerUser(user);
  }

  Future<Either<Failure, bool>> changeEmail(ChangeEmailEntity emails) async {
    return await _authRepository.changeEmail(emails);
  }
  Future<Either<Failure, bool>> changePassword(ChangePasswordEntity pws) async {
    return await _authRepository.changePassword(pws);
  }

  Future<Either<Failure, bool>> loginUser(
      String username, String password) async {
    return await _authRepository.loginUser(username, password);
  }

  Future<Either<Failure, bool>> addNoti(String noti) async{
    return await _authRepository.addNoti(noti);
  }
  Future<Either<Failure, List<String>>> getNoti()async {
    return await _authRepository.getNoti();
  }
  
  Future<Either<Failure, bool>> clearNoti() async{
    return await _authRepository.clearNoti();
  }
}
