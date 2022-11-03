import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/network/dataagents/movie_data_agent.dart';
import 'package:movie_app/network/responses/api_constants.dart';
import 'package:movie_app/network/responses/the_movie_api.dart';
import '../../data/vos/movie_vo.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi mApi;

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  // RetrofitDataAgentImpl() {
  //   final dio = Dio();
  //   mApi = TheMovieApi(dio);
  // }
  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }
  @override
  Future<List<MovieVO>>? getNowPlayingMovies(int page) {
    // TODO: implement getNowPlayingMovies
    return mApi
        .getNowPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results ?? [])
        .first;

    // mApi
    //     ?.getNowPlayingMovie(API_KEY, LANGUAGE_EN_US, page.toString())
    //     .then((response) {
    //   response.results?.forEach((movie) => debugPrint(movie.toString()));
    //   // debugPrint("Now Playing Moviews ======> ${value.toString()}");
    // }).catchError((error) {
    //   debugPrint("Error =====> ${error.toString()}");
    // });
  }

  @override
  Future<List<MovieVO>>? getPopularMovies(int page) {
    // TODO: implement getPopularMovies
    return mApi
        .getPopularMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results ?? [])
        .first;
  }

  @override
  Future<List<MovieVO>>? getTopRatedMovies(int page) {
    return mApi
        .getTopRatedMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results ?? [])
        .first;
  }

  @override
  Future<List<GenreVO>>? getGenres() {
    return mApi
        .getGenres(API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.genres ?? [])
        .first;
  }

  @override
  Future<List<MovieVO>>? getMoviesByGenre(int genreId) {
    return mApi
        .getMoviesByGenre(genreId.toString(), API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.results ?? [])
        .first;
  }

  @override
  Future<List<ActorVO>>? getActors(int page) {
    return mApi
        .getActors(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results ?? [])
        .first;
  }

  @override
  Future<MovieVO>? getMovieDetail(int movieId) {
    return mApi
        .getMovieDetail(movieId.toString(), API_KEY, LANGUAGE_EN_US, "1")
        .asStream()
        .map((response) => response)
        .first;
  }

  @override
  Future<List<CreditVO>>? getCreditsByMovie(int movieId) {
    return mApi
        .getCreditsByMovie(movieId.toString(), API_KEY, LANGUAGE_EN_US, "1")
        .asStream()
        .map((respones) => respones.cast ?? [])
        .first;
  }


}
