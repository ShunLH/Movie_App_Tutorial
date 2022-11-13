import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';

import '../data/models/movie_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier {
  /// Stream
  MovieVO? mMovie;
  List<CreditVO>? mActorsList;
  List<CreditVO>? mCreatorsList;
  List<MovieVO>? mRelatedMovies;

  /// Models
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailsBloc(int movieId,[MovieModel? movieModel]) {
    if (movieModel != null){
      mMovieModel = movieModel;
    }
    /// Movie Details
    mMovieModel.getMovieDetails(movieId)?.then((movie) {
      this.mMovie = movie;
      notifyListeners();
    });

    /// Movie Details from Database
    mMovieModel.getMovieDetailsFromDatabase(movieId)?.then((movie) {
      this.mMovie = movie;
      this.getRelatedMovies(movie.genres?.first.id ?? 0);
      notifyListeners();
    });

    /// Credits

    mMovieModel.getCreditsByMovie(movieId)?.then((creditsList) {
      mActorsList = creditsList.where((credit) => credit.isActor()).toList();
      mCreatorsList =
          creditsList.where((credit) => credit.isCreator()).toList();
    });
  }
  void getRelatedMovies(int genreId) {
    mMovieModel.getMoviesByGenre(genreId)?.then((moviesList) {
      mRelatedMovies = moviesList;
      notifyListeners();
    });
  }
}
