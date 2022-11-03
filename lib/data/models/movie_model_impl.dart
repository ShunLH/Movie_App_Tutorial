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
    getNowPlayingMoviesFromDatabase();
    getTopRatedMoviesFromDatabase();
    getPopularMoviesFromDatabase();
    getActors(1);
    getAllActorsFromDatabase();
    getGenres();
    getGenresFromDatabase();
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

  // @override
  // Future<List<MovieVO>>? getNowPlayingMovies(int page) {
  //   return mDataAgent.getNowPlayingMovies(page)?.then((movies) async {
  //     List<MovieVO> nowPlayingMovies = movies.map((movie) {
  //       movie.isNowPlaying = true;
  //       movie.isTopRated = false;
  //       movie.isPopular = false;
  //       return movie;
  //     }).toList();
  //     mMovieDao.saveMovies(nowPlayingMovies);
  //     return Future.value(movies);
  //   });
  // }
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
      mNowPlayingMovieList = nowPlayingMovies;
      notifyListeners();
    });
  }

  @override
  void getActors(int page) {
    mDataAgent.getActors(page)?.then((actors) async {
      mActorDao.saveAllActors(actors ?? []);
      mActorsList = actors;
      notifyListeners();
      // return Future.value(actors);
    });
  }

  @override
  void getGenres() {
    mDataAgent.getGenres()?.then((genres) async {
      mGenreDao.saveAllGenres(genres);
      mGenresList = genres;
      getMoviesByGenre(genres.first.id ?? 0);
      // getMoviesByGenre(genres.first.id ?? 0)?.then((moviesByGenreList) {
      //   mMoviesByGenreList = moviesByGenreList;
      //   notifyListeners();
      // });
      notifyListeners();
    });
  }

  @override
  void getMoviesByGenre(int genreId) {
     mDataAgent.getMoviesByGenre(genreId)?.then((movieList) {
      mMoviesByGenreList = movieList;
      notifyListeners();
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
      // mPopularMovieList = popularMovies;
      // notifyListeners();
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
      mShowCaseMoviesList = topRatedMovies;
      notifyListeners();
    });
  }

  @override
  Future<MovieVO>? getMovieDetails(int movieId) {
    return mDataAgent.getMovieDetail(movieId)?.then((movie) async {
      MovieVO? movieFromList =  mMovieDao.getMovieById(movie.id ?? 0);
      movie.isNowPlaying = movieFromList?.isNowPlaying;
      movie.isPopular = movieFromList?.isPopular;
      movie.isTopRated = movieFromList?.isTopRated;
      mMovieDao.saveSingleMovie(movie);
      return Future.value(movie);
    });
  }

  @override
  void getCreditsByMovie(int movieId) {
     mDataAgent.getCreditsByMovie(movieId)?.then((creditsList){
       this.mActors =
           creditsList.where((credit) => credit.isActor()).toList();
       this.mCreatorsList =
           creditsList.where((credit) => credit.isCreator()).toList();
       notifyListeners();
     });

  }

  /// Database
  @override
  void getAllActorsFromDatabase() {
    mActorsList = mActorDao.getAllActors();
    notifyListeners();
  }

  @override
  void getGenresFromDatabase() {
    // this.getGenres();
    // return Future.value(mGenreDao.getAllGenres());
    mGenresList = mGenreDao.getAllGenres();
    notifyListeners();
  }

  @override
  void getMovieDetailsFromDatabase(int movieId) {
    mMovie = mMovieDao.getMovieById(movieId);
    notifyListeners();
  }

  // @override
  // Future<List<MovieVO>>? getNowPlayingMoviesFromDatabase() {
  //   return Future.value(mMovieDao.getAllMovies().where((movie) => movie.isNowPlaying ?? true).toList());
  //   ;
  // }
  @override
  // Future<List<MovieVO>>? getNowPlayingMoviesFromDatabase() {
  //   this.getNowPlayingMovies(1);
  //   return mMovieDao
  //       .getAllMoviesEventStream()
  //       .startWith(mMovieDao.getNowPlayingMoviesStream())
  //       .combineLatest(mMovieDao.getNowPlayingMoviesStream(),
  //           (event, movieList) => movieList as List<MovieVO>)
  //       .first;
  // }

  void getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
     mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .map((event) => mMovieDao.getNowPlayingMovies()).listen((nowPlayingMovies) {
          mNowPlayingMovieList = nowPlayingMovies;
          notifyListeners();
     });
  }


  @override
  void getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
     mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .map((event) => mMovieDao.getPopularMovies()).listen((popularMovies) {
          mPopularMovieList = popularMovies.take(7).toList();
          notifyListeners();
     });
  }

  @override
  void getTopRatedMoviesFromDatabase() {
    this.getTopRatedMovies(1);
     mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .map((event) => mMovieDao.getTopRatedMovies()).listen((topRatedMovies){
          mShowCaseMoviesList = topRatedMovies;
          notifyListeners();
    });
  }
}
