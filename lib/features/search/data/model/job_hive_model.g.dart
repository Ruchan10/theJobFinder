// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobHiveModelAdapter extends TypeAdapter<JobHiveModel> {
  @override
  final int typeId = 2;

  @override
  JobHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobHiveModel(
      jobId: fields[0] as String?,
      title: fields[1] as String,
      desc: fields[2] as String,
      company: fields[3] as String,
      jobTime: fields[11] as String,
      location: fields[4] as String,
      salary: fields[10] as String,
      logo: fields[5] as String,
      postedBy: fields[6] as String?,
      appliedBy: (fields[7] as List?)?.cast<String>(),
      bookmarkedBy: (fields[8] as List?)?.cast<String>(),
      acceptedUser: (fields[9] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, JobHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.jobId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.company)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.logo)
      ..writeByte(6)
      ..write(obj.postedBy)
      ..writeByte(7)
      ..write(obj.appliedBy)
      ..writeByte(8)
      ..write(obj.bookmarkedBy)
      ..writeByte(9)
      ..write(obj.acceptedUser)
      ..writeByte(10)
      ..write(obj.salary)
      ..writeByte(11)
      ..write(obj.jobTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
