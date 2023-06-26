import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:the_job_finder/features/auth/domain/entity/student_hive_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';

part 'student_hive_model.g.dart';

final studentHiveModelProvider = Provider(
  (ref) => StudentHiveModel.empty(),
);


@HiveType(typeId: HiveTableConstant.studentTableId)

class StudentHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;


  @HiveField(2)
  final String password;
  
  StudentHiveModel({
    String? id,
    required this.email,
    String? cpassword,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  StudentHiveModel.empty()
      : this(
          id: '',
          email:'',
          cpassword: '',
          password: '',
        );

  @override
  String toString() {
    return 'studentId: $id, Email: $email';
  }

  // convert hive object to entity
  StudentEntity toEntity() => StudentEntity(
        id: id,
        password: password, 
        email: email,
      );

  // convert Entity to Hive Object
  StudentHiveModel toHiveModel(StudentEntity entity) => StudentHiveModel(
        email: entity.email,
        password: entity.password,
      );
  // COnvert Hive List to Entity List
  List<StudentEntity> toEntityList(List<StudentHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
