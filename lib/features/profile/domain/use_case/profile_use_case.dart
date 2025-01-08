import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/profile_entity.dart';
import '../repository/profile_repo.dart';

final profileUsecaseProvider = Provider<ProfileUseCase>(
  (ref) => ProfileUseCase(
    profileRepository: ref.watch(profileRepositoryProvider),
  ),
);

class ProfileUseCase {
  final IProfileRepository profileRepository;

  ProfileUseCase({required this.profileRepository});

  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile) {
    return profileRepository.updateProfile(profile);
  }

  Future<Either<Failure, List<ProfileEntity>>> getUserDetails() {
    return profileRepository.getUserDetails();
  }
    Future<Either<Failure, List<ProfileEntity>>> getApplicants(String jobId) async {
    return profileRepository.getApplicants(jobId);
  }

}
