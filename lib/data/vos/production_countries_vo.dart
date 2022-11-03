import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistance/hive_constants.dart';
part 'production_countries_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HYPE_TYPE_ID_PRODUCTTION_COUNTRY_VO,adapterName: "ProductionCountriesVOAdapter")
class ProductionCountriesVO {

  @JsonKey(name: "iso_3166_1")
  @HiveField(0)
  String? iso31991;
  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  ProductionCountriesVO(this.iso31991, this.name);
  factory ProductionCountriesVO.fromJson(Map<String,dynamic> json) => _$ProductionCountriesVOFromJson(json);
  Map<String,dynamic> toJson() => _$ProductionCountriesVOToJson(this);
}