import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistance/hive_constants.dart';
part 'production_companies_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HYPE_TYPE_ID_PRODUCTION_COMPANY_VO,adapterName: "ProductionCompaniesVOAdapter")
class ProductionCompaniesVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "logo_path")
  @HiveField(2)
  String? logoPath;

  @JsonKey(name: "origin_country")
  @HiveField(3)
  String? originCountry;


  ProductionCompaniesVO(this.id, this.name, this.logoPath, this.originCountry);

  factory ProductionCompaniesVO.fromJson(Map<String,dynamic> json) => _$ProductionCompaniesVOFromJson(json);
  Map<String,dynamic> toJson() => _$ProductionCompaniesVOToJson(this);
}