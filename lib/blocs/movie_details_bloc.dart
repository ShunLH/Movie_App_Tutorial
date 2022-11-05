
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';

import '../data/models/movie_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier{
  /// Stream
  MovieVO? mMovie;
  List<CreditVO>? mActorsList;
  List<CreditVO>? mCreatorsList;


  /// Models
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailsBloc(int movieId) {

    /// Movie Details
    mMovieModel.getMovieDetails(movieId)?.then((movie) {
      this.mMovie = movie;
      notifyListeners();
    });

    /// Movie Details from Database
    mMovieModel.getMovieDetailsFromDatabase(movieId)?.then((movie) {
      this.mMovie = movie;
      notifyListeners();
    });

    /// Credits 

    mMovieModel.getCreditsByMovie(movieId)?.then((creditsList) {
      mActorsList = creditsList.where((credit) => credit.isActor()).toList();
      mCreatorsList = creditsList.where((credit) => credit.isCreator()).toList();

    });
  }

}