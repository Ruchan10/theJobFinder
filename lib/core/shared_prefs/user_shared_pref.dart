import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_job_finder/core/failure/failure.dart';

final userSharedPrefsProvider = Provider<UserSharedPrefs>((ref) {
  return UserSharedPrefs();
});

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;
  // set user token
  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  //get user token
  Future<Either<Failure, String?>> getUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');
      return right(token);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  // Delete token
  Future<Either<Failure, bool>> deleteUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  // set user ID
  Future<Either<Failure, bool>> setUserId(String userId) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('userId', userId);
      print("Inside setUserToken");
      print(userId);
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  // get user ID
  Future<Either<Failure, String?>> getUserId() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final userId = _sharedPreferences.getString('userId');
      print("Inside getUser Id");
      print(userId);
      return right(userId);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
