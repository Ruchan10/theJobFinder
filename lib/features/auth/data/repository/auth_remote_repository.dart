import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:the_job_finder/features/auth/domain/entity/student_hive_entity.dart';
import 'package:the_job_finder/features/auth/domain/repository/auth_repository.dart';

final authRemoteRepositoryProvider =
    Provider.autoDispose<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  Future<Either<Failure, bool>> loginStudent(String email, String password) {
    return _authRemoteDataSource.loginStudent(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerStudent(StudentEntity student) {
    return _authRemoteDataSource.registerStudent(student);
  }

  AuthRemoteRepository(this._authRemoteDataSource);
  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }
}
