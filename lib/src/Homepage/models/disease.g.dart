// GENERATED CODE - DO NOT MODIFY BY HAND
//import 'package:hive/hive.dart';
//import 'disease.dart';
part of 'disease.dart';
// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************


class DiseaseAdapter extends TypeAdapter<Disease> {
  @override
  final int typeId = 0;

  @override
  Disease read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Disease(
        name: fields[0] as String,
        imagePath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Disease obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.possibleCauses)
      ..writeByte(2)
      ..write(obj.possibleSolution)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DiseaseAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}