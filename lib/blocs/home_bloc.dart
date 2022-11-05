
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';

import '../data/models/movie_model.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier{
  ///States
  List<MovieVO>? mNowPlayingMoviesList;
  List<MovieVO>? mPopularMoviesList;
  List<GenreVO>? mGenreList;
  List<ActorVO>? mActors;
  List<MovieVO>? mShowcaseMoviesList;
  List<MovieVO>? mMoviesByGenreList;


  /// Models

  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc(){
    /// Now Playing Movies from Database
    mMovieModel.getNowPlayingMoviesFromDatabase()?.then((movieList) {
      mNowPlayingMoviesList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Popular Movies from Database
    mMovieModel.getPopularMoviesFromDatabase()?.then((movieList) {
      mPopularMoviesList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// ShowCases from Database
    mMovieModel.getTopRatedMoviesFromDatabase()?.then((movieList) {
      mShowcaseMoviesList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
    /// Genres
    mMovieModel.getGenres()?.then((genreList) {
      mGenreList = genreList;
      /// Movies By Genere
      _getMoviesByGenreAndRefresh(genreList.first.id ?? 0);
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Genres from Database
    mMovieModel.getGenresFromDatabase()?.then((genreList) {
      mGenreList = genreList;
      /// Movies By Genere
      _getMoviesByGenreAndRefresh(genreList.first.id ?? 0);
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Actors
    mMovieModel.getActors(1)?.then((actorsList) {
      mActors = actorsList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Actors Database
    mMovieModel.getAllActorsFromDatabase()?.then((actorsList) {
      mActors = actorsList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });


  }
  void onTapGenre(int genreId){
    _getMoviesByGenreAndRefresh(genreId);
  }
  void _getMoviesByGenreAndRefresh(int genreId){
    mMovieModel.getMoviesByGenre(genreId)?.then((movieByGenere) {
      mMoviesByGenreList = movieByGenere;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }


}