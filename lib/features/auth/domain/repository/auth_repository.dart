import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/data/repository/auth_remote_repository.dart';

import '../entity/student_hive_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(StudentEntity student);
  Future<Either<Failure, bool>> loginStudent(String email, String password);
}
