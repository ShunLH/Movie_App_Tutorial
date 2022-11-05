
import 'dart:async';

import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';

import '../data/models/movie_model.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc{
  ///Reactive Stream
  StreamController<List<MovieVO>> mNowPlayingStreamController = StreamController();
  StreamController<List<MovieVO>> mPopularMoviesListStreamController = StreamController();
  StreamController<List<GenreVO>> mGenreListStreamController = StreamController();
  StreamController<List<ActorVO>> mActorsStreamController = StreamController();
  StreamController<List<MovieVO>> mShowCaseMovieListStreamController = StreamController();
  StreamController<List<MovieVO?>> mMoviesByGenreListStreamController = StreamController();

  /// Models

  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc(){
    /// Now Playing Movies from Database
    mMovieModel.getNowPlayingMoviesFromDatabase()?.then((movieList) {
      mNowPlayingStreamController?.sink.add(movieList);
    }).catchError((error) {});

    /// Popular Movies from Database
    mMovieModel.getPopularMoviesFromDatabase()?.then((movieList) {
      mPopularMoviesListStreamController?.sink.add(movieList);
    }).catchError((error) {});

    /// ShowCases from Database
    mMovieModel.getTopRatedMoviesFromDatabase()?.then((movieList) {
      mShowCaseMovieListStreamController?.sink.add(movieList);
    }).catchError((error) {});
    /// Genres
    mMovieModel.getGenres()?.then((genreList) {
      mGenreListStreamController?.sink.add(genreList);
      /// Movies By Genere
      getMoviesByGenreAndRefresh(genreList.first.id ?? 0);
    }).catchError((error) {});

    /// Genres from Database
    mMovieModel.getGenresFromDatabase()?.then((genreList) {
      mGenreListStreamController?.sink.add(genreList);
      /// Movies By Genere
      getMoviesByGenreAndRefresh(genreList.first.id ?? 0);
    }).catchError((error) {});

    /// Actors
    mMovieModel.getActors(1)?.then((actorsList) {
      mActorsStreamController?.sink.add(actorsList);
    }).catchError((error) {});

    /// Actors Database
    mMovieModel.getAllActorsFromDatabase()?.then((actorsList) {
      mActorsStreamController?.sink.add(actorsList);
    }).catchError((error) {});


  }
  void getMoviesByGenreAndRefresh(int genreId){
    mMovieModel.getMoviesByGenre(genreId)?.then((movieByGenere) {
      mMoviesByGenreListStreamController?.sink.add(movieByGenere);
    }).catchError((error) {});
  }

  void dispose(){
    mNowPlayingStreamController?.close();
    mPopularMoviesListStreamController?.close();
    mGenreListStreamController?.close();
    mActorsStreamController?.close();
    mShowCaseMovieListStreamController?.close();
    mMoviesByGenreListStreamController?.close();

  }




}