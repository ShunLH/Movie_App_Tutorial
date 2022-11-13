import 'package:hive/hive.dart';
import 'package:movie_app/persistance/hive_constants.dart';
import 'package:movie_app/resources/colors.dart';

import '../../data/vos/movie_vo.dart';

abstract class MovieDao {

  void saveMovies(List<MovieVO> movies);
  void saveSingleMovie(MovieVO movie);
  List<MovieVO> getAllMovies();
  MovieVO? getMovieById(int movieId);
  List<MovieVO> getNowPlayingMovies();
  List<MovieVO> getPopularMovies();
  List<MovieVO> getTopRatedMovies();

  /// Reactive Programming

  Stream<void> getAllMoviesEventStream();
  Stream<List<MovieVO>> getNowPlayingMoviesStream();
  Stream<List<MovieVO>> getPopularMoviesStream();
  Stream<List<MovieVO>> getTopRatedMoviesStream();

}
