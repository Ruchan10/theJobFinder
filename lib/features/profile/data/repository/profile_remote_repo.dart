import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_remote_data_source.dart';

final profileRemoteRepoProvider = Provider<IProfileRepository>(
  (ref) => ProfileRemoteRepositoryImpl(
    profileRemoteDataSource: ref.read(profileRemoteDataSourceProvider),
  ),
);

class ProfileRemoteRepositoryImpl implements IProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRemoteRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile) {
    return profileRemoteDataSource.updateProfile(profile);
  }
  
  @override
  Future<Either<Failure, List<ProfileEntity>>> getUserDetails() {
        return profileRemoteDataSource.getUserDetails();

  }
   @override
  Future<Either<Failure, List<ProfileEntity>>> getApplicants(String jobId) {
    return profileRemoteDataSource.getApplicants(jobId);
  }
}
