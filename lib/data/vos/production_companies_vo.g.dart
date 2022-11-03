// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionCompaniesVOAdapter extends TypeAdapter<ProductionCompaniesVO> {
  @override
  final int typeId = 8;

  @override
  ProductionCompaniesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompaniesVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompaniesVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.logoPath)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompaniesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompaniesVO _$ProductionCompaniesVOFromJson(
        Map<String, dynamic> json) =>
    ProductionCompaniesVO(
      json['id'] as int?,
      json['name'] as String?,
      json['logo_path'] as String?,
      json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompaniesVOToJson(
        ProductionCompaniesVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };
