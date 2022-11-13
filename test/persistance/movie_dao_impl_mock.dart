
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistance/daos/movie_dao.dart';

import '../mock_data/mock_data.dart';

class MovieDaoImplMock extends MovieDao{
  Map<int,MovieVO> moviesInDatabaseMock = {};
  @override
  List<MovieVO> getAllMovies() {
    return getMockMoviesForTest();
  }

  @override
  Stream<void> getAllMoviesEventStream() {
    return Stream<void>.value(null);
  }

  @override
  MovieVO? getMovieById(int movieId) {
   return moviesInDatabaseMock.values.toList().firstWhere((element) => element.id == movieId);
  }

  @override
  List<MovieVO> getNowPlayingMovies() {
    if (getMockMoviesForTest() != null && getMockMoviesForTest().isNotEmpty){
      return getMockMoviesForTest().where((movie) => movie.isNowPlaying == true).toList();
    }else{
      return [];
    }
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(getMockMoviesForTest().where((element) => element.isNowPlaying == true).toList());
  }

  @override
  List<MovieVO> getPopularMovies() {
    if (getMockMoviesForTest() != null && getMockMoviesForTest().isNotEmpty){
      return getMockMoviesForTest().where((movie) => movie.isPopular == true).toList();
    }else{
      return [];
    }
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(getMockMoviesForTest().where((element) => element.isPopular == true).toList());

  }

  @override
  List<MovieVO> getTopRatedMovies() {
    if (getMockMoviesForTest() != null && getMockMoviesForTest().isNotEmpty){
      return getMockMoviesForTest().where((movie) => movie.isTopRated == true).toList();
    }else{
      return [];
    }
  }

  @override
  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(getMockMoviesForTest().where((element) => element.isTopRated == true).toList());
  }

  @override
  void saveMovies(List<MovieVO> movies) {
    movies.forEach((movie) {
      moviesInDatabaseMock[movie.id ?? 0] = movie;
    });
  }

  @override
  void saveSingleMovie(MovieVO movie) {
      moviesInDatabaseMock[movie.id ?? 0] = movie;
  }
  
}