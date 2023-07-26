import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_profile_finder/core/failure/failure.dart';
import 'package:the_profile_finder/features/search/domain/entity/profile_entity.dart';

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
  Future<Either<Failure, bool>> addProfile(ProfileEntity profile) {
    return profileRemoteDataSource.addProfile(profile);
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> getAllProfiles() {
    return profileRemoteDataSource.getAllProfiles();
  }

  @override
  Future<Either<Failure, bool>> removeBookmark(String id) {
    return profileRemoteDataSource.removeBookmark(id);
  }

  @override
  Future<Either<Failure, bool>> addBookmark(String id) {
    return profileRemoteDataSource.addBookmark(id);
  }
}
