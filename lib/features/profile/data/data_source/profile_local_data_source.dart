import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../../domain/entity/profile_entity.dart';
import '../model/profile_hive_model.dart';

// Dependency Injection using Riverpod
final profileLocalDataSourceProvider = Provider<ProfileLocalDataSource>((ref) {
  return ProfileLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      profileHiveModel: ref.read(profileHiveModelProvider));
});

class ProfileLocalDataSource {
  final HiveService hiveService;
  final ProfileHiveModel profileHiveModel;

  ProfileLocalDataSource({
    required this.hiveService,
    required this.profileHiveModel,
  });

  // Add Profile
  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile) async {
    try {
      // Convert Entity to Hive Object
      final hiveProfile = profileHiveModel.toHiveModel(profile);
      // Add to Hive
      await hiveService.updateProfile(hiveProfile);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
