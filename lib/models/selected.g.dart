// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedAdapter extends TypeAdapter<Selected> {
  @override
  final int typeId = 0;

  @override
  Selected read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Selected(
      campusSelected: fields[1] as String,
      facultySelected: fields[2] as String,
      courseSelected: fields[3] as String,
      groupSelected: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Selected obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.campusSelected)
      ..writeByte(2)
      ..write(obj.facultySelected)
      ..writeByte(3)
      ..write(obj.courseSelected)
      ..writeByte(4)
      ..write(obj.groupSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
