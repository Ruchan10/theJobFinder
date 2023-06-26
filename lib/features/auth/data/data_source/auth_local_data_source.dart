import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/core/network/hive_service.dart';
import 'package:the_job_finder/features/auth/data/model/student_hive_model.dart';
import 'package:the_job_finder/features/auth/domain/entity/student_hive_entity.dart';


final authLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(studentHiveModelProvider),
  ),
);

class AuthLocalDataSource {
  final HiveService _hiveService;
  final StudentHiveModel _authHiveModel;

  AuthLocalDataSource(this._hiveService, this._authHiveModel);

  Future<Either<Failure, bool>> registerStudent(StudentEntity student) async {
    try {
      await _hiveService.addStudent(_authHiveModel.toHiveModel(student));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginStudent(
    String username,
    String password,
  ) async {
    try {
      StudentHiveModel? students = await _hiveService.login(username, password);
      if (students == null) {
        return Left(Failure(error: 'Username or password is wrong'));
      } else {
        return const Right(true);
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}