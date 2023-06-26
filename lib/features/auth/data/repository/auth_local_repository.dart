import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:the_job_finder/features/auth/domain/entity/student_hive_entity.dart';
import 'package:the_job_finder/features/auth/domain/repository/auth_repository.dart';


final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
    ref.read(authLocalDataSourceProvider),
  );
});

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginStudent(String username, String password) {
    return _authLocalDataSource.loginStudent(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerStudent(StudentEntity student) {
    return _authLocalDataSource.registerStudent(student);
  }
  
  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }

}
