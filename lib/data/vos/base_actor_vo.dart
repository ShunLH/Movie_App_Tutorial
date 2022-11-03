
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistance/hive_constants.dart';
part 'base_actor_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HYPE_TYPE_ID_BASE_ACTOR_VO,adapterName: "BaseActorVOAdapter")
class BaseActorVO{
  @JsonKey(name: "name")
  @HiveField(10)
  String? name;

  @JsonKey(name: "profile_path")
  @HiveField(11)
  String? profilePath;

  BaseActorVO(this.name, this.profilePath);


  factory BaseActorVO.fromJson(Map<String, dynamic> json) =>
      _$BaseActorVOFromJson(json);

  Map<String, dynamic> toJson() => _$BaseActorVOToJson(this);

}