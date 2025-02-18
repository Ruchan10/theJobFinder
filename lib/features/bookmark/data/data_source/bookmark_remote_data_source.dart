import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../domain/entity/bookmark_entity.dart';
import '../dto/get_all_bookmarks.dart';
import '../model/bookmark_api_model.dart';

final bookmarkRemoteDataSourceProvider = Provider(
  (ref) => BookmarkRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    bookmarkApiModel: ref.read(bookmarkApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class BookmarkRemoteDataSource {
  final Dio dio;
  final BookmarkApiModel bookmarkApiModel;
  final UserSharedPrefs userSharedPrefs;

  BookmarkRemoteDataSource({
    required this.dio,
    required this.bookmarkApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addBookmark(BookmarkEntity bookmark) async {
    try {
      var response = await dio.post(
        ApiEndpoints.addBookmark,
        data: bookmarkApiModel.fromEntity(bookmark).toJson(),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarks() async {
    try {

      final tokenOption = await userSharedPrefs.getUserToken();
      final token = tokenOption.getOrElse(() => null);

      final response = await dio.get(
        ApiEndpoints.getBookmark,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final bookmarkAddDTO = GetAllBookmarkDTO.fromJson(response.data);
        final entities = bookmarkApiModel.toEntityList(bookmarkAddDTO.data);
        return Right(entities);
      } else {
        return Left(
          Failure(
            error: 'Failed to retrieve bookmarks. ${response.statusCode}',
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: 'Failed to retrieve bookmarks. ${e.error.toString()}',
        ),
      );
    }
  }
    Future<Either<Failure, bool>> removeBookmark(String jobId) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.removeBookmark + jobId,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

}
