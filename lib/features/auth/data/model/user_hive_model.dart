import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/user_hive_entity.dart';

part 'user_hive_model.g.dart';

final userHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);


@HiveType(typeId: HiveTableConstant.userTableId)

class UserHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;


  @HiveField(2)
  final String password;
  
  UserHiveModel({
    String? id,
    required this.email,
    String? cpassword,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  UserHiveModel.empty()
      : this(
          id: '',
          email:'',
          cpassword: '',
          password: '',
        );

  @override
  String toString() {
    return 'userId: $id, Email: $email';
  }

  // convert hive object to entity
  UserEntity toEntity() => UserEntity(
        id: id,
        password: password, 
        email: email,
      );

  // convert Entity to Hive Object
  UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
        email: entity.email,
        password: entity.password,
      );
  // COnvert Hive List to Entity List
  List<UserEntity> toEntityList(List<UserHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
