import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistance/hive_constants.dart';
part 'genre_vo.g.dart';

@HiveType(typeId: HYPE_TYPE_ID_GENRE_VO,adapterName: "GenreVOAdapter")
@JsonSerializable()
class GenreVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name:"name")
  @HiveField(1)
  String? name;

  GenreVO(this.id, this.name);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  factory GenreVO.fromJson(Map<String,dynamic> json) => _$GenreVOFromJson(json);
  Map<String,dynamic> toJson() => _$GenreVOToJson(this);
}