import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../repository/application_repo.dart';

final applicationUsecaseProvider = Provider<ApplicationUseCase>(
  (ref) => ApplicationUseCase(
    applicationRepository: ref.watch(applicationRepositoryProvider),
  ),
);

class ApplicationUseCase {
  final IApplicationRepository applicationRepository;

  ApplicationUseCase({required this.applicationRepository});

  Future<Either<Failure, bool>> deleteJob(String id) async {
    return applicationRepository.deleteJob(id);
  }

}
