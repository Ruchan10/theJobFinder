import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_job_finder/features/bookmark/data/model/bookmark_hive_model.dart';
import 'package:the_job_finder/features/search/data/model/job_hive_model.dart';

import '../../../config/constants/hive_table_constant.dart';
import '../../../features/auth/data/model/user_hive_model.dart';
import '../../../features/profile/data/model/profile_hive_model.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  // get hiveService => null;

  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(UserHiveModelAdapter());
    Hive.registerAdapter(BookmarkHiveModelAdapter());
    Hive.registerAdapter(JobHiveModelAdapter());
  }

  // ======================== User Queries ========================
  Future<void> addUser(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.put(user.id, user);
  }

  Future<List<UserHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var users = box.values.toList();
    box.close();
    return users;
  }

  //Login
  Future<UserHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere(
        (element) => element.email == email && element.password == password);
    box.close();
    return user;
  }

// Bookmark queries
  Future<void> addBookmark(BookmarkHiveModel bookmark) async {
    var box =
        await Hive.openBox<BookmarkHiveModel>(HiveTableConstant.bookmarkBox);
    await box.put(bookmark.bookmarkId, bookmark);
  }

  Future<List<BookmarkHiveModel>> getAllBookmarks() async {
    var box =
        await Hive.openBox<BookmarkHiveModel>(HiveTableConstant.bookmarkBox);
    var bookmarks = box.values.toList();
    box.close();
    return bookmarks;
  }

  Future<List<JobHiveModel>> getApplied() async {
    var box =
        await Hive.openBox<JobHiveModel>(HiveTableConstant.applicationBox);
    var applieds = box.values.toList();
    box.close();
    return applieds;
  }

  Future<List<JobHiveModel>> getCreated() async {
    var box =
        await Hive.openBox<JobHiveModel>(HiveTableConstant.applicationBox);
    var applieds = box.values.toList();
    box.close();
    return applieds;
  }

// Job Queries
  Future<void> addJob(JobHiveModel job) async {
    var box = await Hive.openBox<JobHiveModel>(HiveTableConstant.jobBox);
    await box.put(job.jobId, job);
  }

  Future<List<JobHiveModel>> getAllJobs() async {
    var box = await Hive.openBox<JobHiveModel>(HiveTableConstant.jobBox);
    var jobs = box.values.toList();
    box.close();
    return jobs;
  }

  Future<void> updateProfile(ProfileHiveModel profile) async {
    var box =
        await Hive.openBox<ProfileHiveModel>(HiveTableConstant.profileBox);
    await box.put(profile.profileId, profile);
  }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.clear();
  }

  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.bookmarkBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.jobBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.profileBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.applicationBox);

    await Hive.deleteFromDisk();
  }
}
