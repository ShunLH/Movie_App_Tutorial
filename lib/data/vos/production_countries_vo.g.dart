// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_countries_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionCountriesVOAdapter extends TypeAdapter<ProductionCountriesVO> {
  @override
  final int typeId = 9;

  @override
  ProductionCountriesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountriesVO(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountriesVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31991)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountriesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountriesVO _$ProductionCountriesVOFromJson(
        Map<String, dynamic> json) =>
    ProductionCountriesVO(
      json['iso_3166_1'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountriesVOToJson(
        ProductionCountriesVO instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31991,
      'name': instance.name,
    };
