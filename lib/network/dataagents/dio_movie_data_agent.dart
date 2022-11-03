import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../data/vos/movie_vo.dart';
import '../responses/api_constants.dart';
import 'movie_data_agent.dart';

// class DioMovieDataAgentImpl extends MovieDataAgent{
//
//   @override
//   Future<List<MovieVO>>? getNowPlayingMovies(int page) {
//     Map<String,String> queryParameters = {
//       PARAM_API_KEY : API_KEY,
//       PARAM_LANGUAGE : LANGUAGE_EN_US,
//       PARAM_PAGE : page.toString()
//     };
//     Dio().get("$BASE_URL_DIO$ENDPOINT_GET_NOW_PLAYING",queryParameters: queryParameters).then((value) {
//       debugPrint("Now Playing Movies =====> ${value.toString()}");
//     }).catchError((error) {
//       debugPrint("Now Playing ERROR =====> ${error.toString()}");
//     });
//
//   }
//
// }