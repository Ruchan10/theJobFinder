import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';

import '../repository/noti.repo.dart';

final notiUseCaseProvider = Provider((ref) {
  return NotiUseCase(
    ref.read(notiRepositoryProvider),
  );
});

class NotiUseCase {
  final INotiRepository _notiRepository;

  NotiUseCase(this._notiRepository);

  Future<Either<Failure, bool>> addNoti(String noti, String userId) async{
    return await _notiRepository.addNoti(noti, userId);
  }
  Future<Either<Failure, List<dynamic>>> getNoti()async {
    return await _notiRepository.getNoti();
  }
  
  Future<Either<Failure, bool>> clearNoti() async{
    return await _notiRepository.clearNoti();
  }
}
