// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_actor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActorResponse _$GetActorResponseFromJson(Map<String, dynamic> json) =>
    GetActorResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..page = json['page'] as int?;

Map<String, dynamic> _$GetActorResponseToJson(GetActorResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
