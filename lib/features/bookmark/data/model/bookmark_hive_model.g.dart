// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkHiveModelAdapter extends TypeAdapter<BookmarkHiveModel> {
  @override
  final int typeId = 1;

  @override
  BookmarkHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkHiveModel(
      bookmarkId: fields[0] as String?,
      title: fields[1] as String,
      desc: fields[2] as String,
      company: fields[3] as String,
      location: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bookmarkId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.company)
      ..writeByte(4)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
