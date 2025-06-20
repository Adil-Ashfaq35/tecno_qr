// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRModelAdapter extends TypeAdapter<QRModel> {
  @override
  final int typeId = 0;

  @override
  QRModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QRModel(
      fields[0] as String,
      fields[1] as DateTime,
      fields[2] as bool,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QRModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.qrData)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.iscreate)
      ..writeByte(3)
      ..write(obj.isExpanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
