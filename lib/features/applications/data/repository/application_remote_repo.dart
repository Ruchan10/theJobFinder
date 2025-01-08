import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repository/application_repo.dart';
import '../data_source/application_remote_data_source.dart';

final applicationRemoteRepoProvider = Provider<IApplicationRepository>(
  (ref) => ApplicationRemoteRepositoryImpl(
    applicationRemoteDataSource: ref.read(applicationRemoteDataSourceProvider),
  ),
);

class ApplicationRemoteRepositoryImpl implements IApplicationRepository {
  final ApplicationRemoteDataSource applicationRemoteDataSource;

  ApplicationRemoteRepositoryImpl({required this.applicationRemoteDataSource});


  @override
  Future<Either<Failure, bool>> deleteJob(String id) {
    return applicationRemoteDataSource.deleteJob(id);
  }

}
