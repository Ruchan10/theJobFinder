import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/profile_remote_repo.dart';
import '../entity/profile_entity.dart';

final profileRepositoryProvider = Provider<IProfileRepository>(
  (ref) {
    // // Check for the internet
    // final internetStatus = ref.watch(connectivityStatusProvider);
    // print("INTERNET-----------");
    // print(internetStatus);
    // return ref.watch(profileRemoteRepoProvider);

    if (true) {
      return ref.watch(profileRemoteRepoProvider);
    } 
  },
);

abstract class IProfileRepository {
  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile);
  Future<Either<Failure, List<ProfileEntity>>> getUserDetails();
  Future<Either<Failure, List<ProfileEntity>>> getApplicants(String jobId);
}
