// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMoviesByGenreResponse _$GetMoviesByGenreResponseFromJson(
        Map<String, dynamic> json) =>
    GetMoviesByGenreResponse(
      json['name'] as String?,
      json['favorite_count'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['poster_path'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$GetMoviesByGenreResponseToJson(
        GetMoviesByGenreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favorite_count': instance.favoriteCount,
      'items': instance.items,
      'poster_path': instance.posterPath,
    };
