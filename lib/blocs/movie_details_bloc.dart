
import 'dart:async';

import 'package:movie_app/data/models/movie_model_impl.dart';

import '../data/models/movie_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsBloc {
  /// Stream Controller

  StreamController<MovieVO>? movieStreamController = StreamController();
  StreamController<List<CreditVO>>? creatorsStreamController = StreamController();
  StreamController<List<CreditVO>>? actorsStreamController = StreamController();

  /// Models
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailsBloc(int movieId) {

    /// Movie Details
    mMovieModel.getMovieDetails(movieId)?.then((movie) {
      movieStreamController?.sink.add(movie);
    });

    /// Movie Details from Database
    mMovieModel.getMovieDetailsFromDatabase(movieId)?.then((movie) {
      movieStreamController?.sink.add(movie);
    });

    /// Credits 

    mMovieModel.getCreditsByMovie(movieId)?.then((creditsList) {
      actorsStreamController?.sink.add(creditsList.where((credit) => credit.isActor()).toList());
      creatorsStreamController?.sink.add(creditsList.where((credit) => credit.isCreator()).toList());

    });
  }

  void disposeStream(){
    movieStreamController?.close();
    actorsStreamController?.close();
    creatorsStreamController?.close();
  }
  


}