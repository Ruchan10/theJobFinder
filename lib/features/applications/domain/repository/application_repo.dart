import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/application_remote_repo.dart';

final applicationRepositoryProvider = Provider<IApplicationRepository>(
  (ref) {
    return ref.watch(applicationRemoteRepoProvider);
  },
);

abstract class IApplicationRepository {
  Future<Either<Failure, bool>> deleteJob(String id);
}
