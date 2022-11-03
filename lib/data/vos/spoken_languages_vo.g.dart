// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_languages_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpokenLanguagesVOAdapter extends TypeAdapter<SpokenLanguagesVO> {
  @override
  final int typeId = 10;

  @override
  SpokenLanguagesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguagesVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguagesVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguagesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguagesVO _$SpokenLanguagesVOFromJson(Map<String, dynamic> json) =>
    SpokenLanguagesVO(
      json['english_name'] as String?,
      json['iso_639_1'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguagesVOToJson(SpokenLanguagesVO instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
