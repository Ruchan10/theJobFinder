import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_job_finder/features/auth/data/model/student_hive_model.dart';
import 'package:the_job_finder/features/bookmark/data/model/bookmark_hive_model.dart';
import 'package:the_job_finder/features/search/data/model/job_hive_model.dart';

import '../../config/constants/hive_table_constant.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  // get hiveService => null;

  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(StudentHiveModelAdapter());
    Hive.registerAdapter(BookmarkHiveModelAdapter());
    Hive.registerAdapter(JobHiveModelAdapter());

    // Add dummy data
    await addDummyBookmark();
    await addDummyJob();
  }

  // Bookmark Dummy Data
  Future<void> addDummyBookmark() async {
    // check of bookmark box is empty
    var box =
        await Hive.openBox<BookmarkHiveModel>(HiveTableConstant.bookmarkBox);
    if (box.isEmpty) {
      // final b1 = BookmarkHiveModel(
      //     title: 'Test0',
      //     company: 'Apple',
      //     desc: 'Testing...',
      //     location: 'Apple Park');
      // final b0 = BookmarkHiveModel(
      //     title: 'Test1',
      //     company: 'Microsoft',
      //     desc: 'Testing0...',
      //     location: 'Micro Park');
      // final b2 = BookmarkHiveModel(
      //     title: 'Test2',
      //     company: 'Tesla',
      //     desc: 'Testing1....',
      //     location: 'Tesla Park');

      // List<BookmarkHiveModel> bookmarks = [b1, b2, b0];

      // Insert bookmark with key
      // for (var bookmark in bookmarks) {
      //   await addBookmark(bookmark);
      // }
    }
  }

  // Job Dummy Data
  Future<void> addDummyJob() async {
    // check of bookmark box is empty
    var box = await Hive.openBox<JobHiveModel>(HiveTableConstant.jobBox);
    if (box.isEmpty) {
      // final j1 = JobHiveModel(
      //     title: 'job0',
      //     company: 'Apple',
      //     desc: 'Full Time',
      //     location: 'Apple Park');
      // final j0 = JobHiveModel(
      //     title: 'job1',
      //     company: 'Microsoft',
      //     desc: 'Part Time',
      //     location: 'Micro Park');
      // final j2 = JobHiveModel(
      //     title: 'job2',
      //     company: 'Tesla',
      //     desc: 'Full Time',
      //     location: 'Tesla Park');

      // List<JobHiveModel> jobs = [j1, j2, j0];

      // Insert bookmark with key
      // for (var job in jobs) {
      //   await addJob(job);
      // }
    }
  }

  // ======================== Student Queries ========================
  Future<void> addStudent(StudentHiveModel student) async {
    var box =
        await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
    await box.put(student.id, student);
  }

  Future<List<StudentHiveModel>> getAllStudents() async {
    var box =
        await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
    var students = box.values.toList();
    box.close();
    return students;
  }

  //Login
  Future<StudentHiveModel?> login(String email, String password) async {
    var box =
        await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
    var student = box.values.firstWhere(
        (element) => element.email == email && element.password == password);
    box.close();
    return student;
  }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box =
        await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
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
    await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);

    await Hive.deleteFromDisk();
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
}
