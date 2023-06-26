import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_job_finder/features/auth/data/model/student_hive_model.dart';

import '../../config/constants/hive_table_constant.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(StudentHiveModelAdapter());
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
}
