// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileHiveModelAdapter extends TypeAdapter<ProfileHiveModel> {
  @override
  final int typeId = 3;

  @override
  ProfileHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileHiveModel(
      profileId: fields[0] as String?,
      fullName: fields[1] as String?,
      email: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      cv: fields[4] as String?,
      profile: fields[5] as String?,
      password: fields[6] as String?,
      bookmarkedJobs: (fields[8] as List?)?.cast<String>(),
      appliedJobs: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProfileHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.profileId)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.cv)
      ..writeByte(5)
      ..write(obj.profile)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.appliedJobs)
      ..writeByte(8)
      ..write(obj.bookmarkedJobs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
