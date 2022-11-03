import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:scoped_model/scoped_model.dart';

import '../vos/movie_vo.dart';

abstract class MovieModel extends Model{



  void getNowPlayingMovies(int page);
  void getPopularMovies(int page);
  void getTopRatedMovies(int page);
  void getGenres();
  void getActors(int page);
  void getMoviesByGenre(int genreId);
  void getMovieDetails(int movieId);
  void getCreditsByMovie(int movieId);

  //Database
  void getTopRatedMoviesFromDatabase();
  void getNowPlayingMoviesFromDatabase();
  void getPopularMoviesFromDatabase();
  void getGenresFromDatabase();
  void getAllActorsFromDatabase();
  void getMovieDetailsFromDatabase(int movieId);

}