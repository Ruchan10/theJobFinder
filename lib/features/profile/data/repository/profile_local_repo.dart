import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_local_data_source.dart';

final profileLocalRepoProvider = Provider<IProfileRepository>((ref) {
  return ProfileLocalRepositoryImpl(
    profileLocalDataSource: ref.read(profileLocalDataSourceProvider),
  );
});

class ProfileLocalRepositoryImpl implements IProfileRepository {
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileLocalRepositoryImpl({
    required this.profileLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> addProfile(ProfileEntity profile) {
    return profileLocalDataSource.addProfile(profile);
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> getAllProfiles() {
    return profileLocalDataSource.getAllProfiles();
  }
  
  @override
  Future<Either<Failure, bool>> removeBookmark(String id) {
    // TODO: implement removeBookmark
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> addBookmark(String id) {
    // TODO: implement addBookmark
    throw UnimplementedError();
  }


}
