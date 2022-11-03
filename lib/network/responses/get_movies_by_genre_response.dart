
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

part 'get_movies_by_genre_response.g.dart';
@JsonSerializable()
class GetMoviesByGenreResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "favorite_count")
  int? favoriteCount;
  @JsonKey(name: "items")
  List<MovieVO>? items;
  @JsonKey(name: "poster_path")
  String? posterPath;

  GetMoviesByGenreResponse(this.name, this.favoriteCount, this.items,this.posterPath);

  factory GetMoviesByGenreResponse.fromJson(Map<String,dynamic> json) => _$GetMoviesByGenreResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetMoviesByGenreResponseToJson(this);
}