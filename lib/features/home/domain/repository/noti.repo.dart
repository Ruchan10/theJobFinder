import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';

import '../../data/repository/home_remote_repository.dart';

final notiRepositoryProvider = Provider<INotiRepository>((ref) {
  return ref.read(notiRemoteRepositoryProvider);
});

abstract class INotiRepository {
  Future<Either<Failure, bool>> addNoti(String noti, String userId);
  Future<Either<Failure, List<dynamic>>> getNoti();
  Future<Either<Failure, bool>> clearNoti();
}
