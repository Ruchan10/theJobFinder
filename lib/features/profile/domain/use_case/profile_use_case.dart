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

  Future<Either<Failure, List<ProfileEntity>>> getAllProfiles() {
    return profileRepository.getAllProfiles();
  }

  Future<Either<Failure, bool>> addProfile(ProfileEntity profile) {
    return profileRepository.addProfile(profile);
  }

  Future<Either<Failure, bool>> removeBookmark(String id) async {
    return profileRepository.removeBookmark(id);
  }

  Future<Either<Failure, bool>> addBookmark(String id) async {
    return profileRepository.addBookmark(id);
  }
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByProfile(String profileId) {
  //   return profileRepository.getAllStudentsByProfile(profileId);
  // }
}
