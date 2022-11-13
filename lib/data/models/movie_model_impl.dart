import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/dataagents/movie_data_agent.dart';
import 'package:movie_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../persistance/daos/actor_dao.dart';
import '../../persistance/daos/genre_dao.dart';
import '../../persistance/daos/movie_dao.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  MovieModelImpl._internal(){
    // getNowPlayingMoviesFromDatabase();
    // getTopRatedMoviesFromDatabase();
    // getPopularMoviesFromDatabase();
    // getActors(1);
    // getAllActorsFromDatabase();
    // getGenres();
    // getGenresFromDatabase();
  }

  /// Daos
  MovieDao mMovieDao = MovieDao();
  GenreDao mGenreDao = GenreDao();
  ActorDao mActorDao = ActorDao();

  ///States
  /// Home Pate
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularMovieList;
  List<MovieVO>? mShowCaseMoviesList;
  List<GenreVO>? mGenresList;
  List<ActorVO>? mActorsList;
  List<MovieVO>? mMoviesByGenreList;

  /// Movie Detail Page
  MovieVO? mMovie;
  List<CreditVO>? mActors;
  List<CreditVO>? mCreatorsList;

  @override
  void getNowPlayingMovies(int page) {
     mDataAgent.getNowPlayingMovies(page)?.then((movies) async {
      List<MovieVO> nowPlayingMovies = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isTopRated = false;
        movie.isPopular = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(nowPlayingMovies);
     });
  }
  // @override
  // void getNowPlayingMovies(int page) {
  //   mDataAgent.getNowPlayingMovies(page)?.then((movies) async {
  //     List<MovieVO> nowPlayingMovies = movies.map((movie) {
  //       movie.isNowPlaying = true;
  //       movie.isTopRated = false;
  //       movie.isPopular = false;
  //       return movie;
  //     }).toList();
  //     mMovieDao.saveMovies(nowPlayingMovies);
  //     mNowPlayingMovieList = nowPlayingMovies;
  //     notifyListeners();
  //   });
  // }

  @override
  Future<List<ActorVO>>? getActors(int page) {
   return mDataAgent.getActors(page)?.then((actors) async {
      mActorDao.saveAllActors(actors ?? []);
      mActorsList = actors;
      // notifyListeners();
      return Future.value(actors);
    });
  }

  @override
  Future<List<GenreVO>>? getGenres() {
    return mDataAgent.getGenres()?.then((genres) async {
      mGenreDao.saveAllGenres(genres);
      mGenresList = genres;
      getMoviesByGenre(genres.first.id ?? 0);
      return Future.value(genres);
      // getMoviesByGenre(genres.first.id ?? 0)?.then((moviesByGenreList) {
      //   mMoviesByGenreList = moviesByGenreList;
      //   notifyListeners();
      // });
      // notifyListeners();
    });
  }

  @override
  Future<List<MovieVO>>? getMoviesByGenre(int genreId) {
    return mDataAgent.getMoviesByGenre(genreId)?.then((movieList) async{
      // mMoviesByGenreList = movieList;
      // notifyListeners();
      return Future.value(movieList);
    });
  }

  @override
  void getPopularMovies(int page) {
     mDataAgent.getPopularMovies(page)?.then((movies) async {
      List<MovieVO> popularMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        movie.isPopular = true;
        return movie;
      }).toList();
      mMovieDao.saveMovies(popularMovies);

    });
  }

  @override
  void getTopRatedMovies(int page) {
     mDataAgent.getTopRatedMovies(page)?.then((movies) async {
      List<MovieVO> topRatedMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isTopRated = true;
        movie.isPopular = false;
        return movie;
      }).toList();
      mMovieDao.saveMovies(topRatedMovies);
    });
  }

  @override
  Future<MovieVO>? getMovieDetails(int movieId) {
    return mDataAgent.getMovieDetail(movieId)?.then((movie) async{
      MovieVO? movieFromList =  mMovieDao.getMovieById(movie.id ?? 0);
      movie.isNowPlaying = movieFromList?.isNowPlaying;
      movie.isPopular = movieFromList?.isPopular;
      movie.isTopRated = movieFromList?.isTopRated;
      mMovieDao.saveSingleMovie(movie);
      return Future.value(movie);
    });
  }

  @override
  Future<List<CreditVO>>? getCreditsByMovie(int movieId) {
      return mDataAgent.getCreditsByMovie(movieId);
  }

  /// Database
  @override
  Future<List<ActorVO>>? getAllActorsFromDatabase() {

    return Future.value(mActorDao.getAllActors());
  }

  @override
  Future<List<GenreVO>>? getGenresFromDatabase() {
    return Future.value(mGenreDao.getAllGenres());

  }

  @override
  Future<MovieVO>? getMovieDetailsFromDatabase(int movieId) {

    return Future.value(mMovieDao.getMovieById(movieId));
  }

  // @override
  // Future<List<MovieVO>>? getNowPlayingMoviesFromDatabase() {
  //   return Future.value(mMovieDao.getAllMovies().where((movie) => movie.isNowPlaying ?? true).toList());
  //   ;
  // }
  @override
  Stream<List<MovieVO>>? getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
    .map((event) => mMovieDao.getNowPlayingMovies());
  }

  @override
  Stream<List<MovieVO>>? getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .map((event) => mMovieDao.getPopularMovies());
  }

  @override
  Stream<List<MovieVO>>? getTopRatedMoviesFromDatabase() {
    this.getTopRatedMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .map((event) => mMovieDao.getTopRatedMovies());

  }

  // void getNowPlayingMoviesFromDatabase() {
  //   this.getNowPlayingMovies(1);
  //    mMovieDao
  //       .getAllMoviesEventStream()
  //       .startWith(mMovieDao.getNowPlayingMoviesStream())
  //       .map((event) => mMovieDao.getNowPlayingMovies()).listen((nowPlayingMovies) {
  //         mNowPlayingMovieList = nowPlayingMovies;
  //         notifyListeners();
  //    });
  // }


  // @override
  // void getPopularMoviesFromDatabase() {
  //   this.getPopularMovies(1);
  //    mMovieDao
  //       .getAllMoviesEventStream()
  //       .startWith(mMovieDao.getPopularMoviesStream())
  //       .map((event) => mMovieDao.getPopularMovies()).listen((popularMovies) {
  //         mPopularMovieList = popularMovies.take(7).toList();
  //         notifyListeners();
  //    });
  // }
  //
  // @override
  // void getTopRatedMoviesFromDatabase() {
  //   this.getTopRatedMovies(1);
  //    mMovieDao
  //       .getAllMoviesEventStream()
  //       .startWith(mMovieDao.getTopRatedMoviesStream())
  //       .map((event) => mMovieDao.getTopRatedMovies()).listen((topRatedMovies){
  //         mShowCaseMoviesList = topRatedMovies;
  //         notifyListeners();
  //   });
  // }
}
