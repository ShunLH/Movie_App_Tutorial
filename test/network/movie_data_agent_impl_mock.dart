import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/dataagents/movie_data_agent.dart';

import '../mock_data/mock_data.dart';

class MovieDataAgentImplMock extends MovieDataAgent {
  @override
  Future<List<ActorVO>>? getActors(int page) {
    return Future.value(getMockActors());
  }

  @override
  Future<List<CreditVO>>? getCreditsByMovie(int movieId) {
    return Future.value(getMockCredits());
  }

  @override
  Future<List<GenreVO>>? getGenres() {
    Future.value(getMockGenres());
  }

  @override
  Future<MovieVO>? getMovieDetail(int movieId) {
    Future.value(getMockMoviesForTest().first);
  }

  @override
  Future<List<MovieVO>>? getMoviesByGenre(int genreId) {
    Future.value(getMockMoviesForTest());
  }

  @override
  Future<List<MovieVO>>? getNowPlayingMovies(int page) {
    Future.value(getMockMoviesForTest()
        .where((movie) => movie.isNowPlaying ?? false)
        .toList());
  }

  @override
  Future<List<MovieVO>>? getPopularMovies(int page) {
    Future.value(getMockMoviesForTest()
        .where((movie) => movie.isPopular == true)
        .toList());
  }

  @override
  Future<List<MovieVO>>? getTopRatedMovies(int page) {
    Future.value(getMockMoviesForTest()
        .where((movie) => movie.isTopRated == true)
        .toList());
  }
}
