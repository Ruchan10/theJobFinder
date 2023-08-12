import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';

import '../../domain/repository/noti.repo.dart';
import '../data_source/home_remote_data_source.dart';

final notiRemoteRepositoryProvider =
    Provider.autoDispose<INotiRepository>((ref) {
  return NotiRemoteRepository(
    ref.read(notiRemoteDataSourceProvider),
  );
});

class NotiRemoteRepository implements INotiRepository {
  final NotiRemoteDataSource _notiRemoteDataSource;
  NotiRemoteRepository(this._notiRemoteDataSource);

  @override
  Future<Either<Failure, bool>> addNoti(String noti, String userId) {
    return _notiRemoteDataSource.addNoti(noti, userId);
  }@override
  Future<Either<Failure, List<dynamic>>> getNoti() {
    return _notiRemoteDataSource.getNoti();
  }
  @override
  Future<Either<Failure, bool>> clearNoti() {
    return _notiRemoteDataSource.clearNoti();
  }
}
