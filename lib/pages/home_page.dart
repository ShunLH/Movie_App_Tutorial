import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/pages/movie_detail_page.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/viewitems/banner_view.dart';
import 'package:movie_app/viewitems/show_case_view.dart';
import 'package:movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:movie_app/widgets/title_text.dart';
import '../blocs/home_bloc.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../viewitems/movie_view.dart';
import '../widgets/see_more_text.dart';
import '../widgets/title_text_with_see_more_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          centerTitle: true,
          title: Text(
            MAIN_SCREEN_APP_BAR_TITLE,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: Icon(
            Icons.menu,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 0, top: 0, right: MARGIN_MEDIUM_2, bottom: 0),
              child: Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: Container(
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Selector<HomeBloc,List<MovieVO>?>(
                  selector: (context,bloc) => bloc.mPopularMoviesList,
                  builder: (context, popularList, child) {
                    return BannerSectionView(
                        popularList?.take(7)?.toList() ?? [],
                        (movieId) {
                      _navigateToMovieDetailScreen(context, movieId);
                    });
                  },
                ),
                SizedBox(height: MARGIN_LARGE),
                // Consumer<HomeBloc>(
                //   builder:  (context,bloc,child) {
                //     return BestPopularMoviesAndSerialsSectionView(
                //             (movieId) =>
                //             _navigateToMovieDetailScreen(context, movieId),
                //         bloc.mNowPlayingMoviesList);
                //   },
                // ),
                Selector<HomeBloc, List<MovieVO>?>(
                  selector: (context,bloc) => bloc.mNowPlayingMoviesList,
                  builder: (context, nowPlayingList, child) {
                    return BestPopularMoviesAndSerialsSectionView(
                        (movieId) =>
                            _navigateToMovieDetailScreen(context, movieId),
                        nowPlayingList);
                  },
                ),
                SizedBox(height: MARGIN_LARGE),
                CheckMovieShowTimeSectionView(),
                SizedBox(height: MARGIN_LARGE),
                Selector<HomeBloc,List<GenreVO>?>(
                  selector: (context,bloc) => bloc.mGenreList,
                  builder: (context, genresList, child) {
                    return Selector<HomeBloc,List<MovieVO>?>(
                      selector: (context,bloc) => bloc.mMoviesByGenreList,
                      builder: (context,moviesByGenreList,child){
                        return GenreSectionView(
                          onTapMovie: (movieId) =>
                              _navigateToMovieDetailScreen(context, movieId),
                          genreList: genresList ?? [],
                          moviesListByGenre: moviesByGenreList ?? [],
                          onTapGenre: (genreId) {
                            HomeBloc bloc = Provider.of<HomeBloc>(context,listen: false);
                            bloc.onTapGenre(genreId);
                          },
                        );
                      }
                    );
                  },
                ),
                SizedBox(height: MARGIN_LARGE),
                Selector<HomeBloc,List<MovieVO>?>(
                  selector: (context,bloc) => bloc.mShowcaseMoviesList,
                  builder: (context, showCaseList, child) {
                    return ShowCasesSection(
                        showCaseList,
                        (movieId) =>
                            _navigateToMovieDetailScreen(context, movieId));
                  },
                ),
                SizedBox(height: MARGIN_LARGE),
                Selector<HomeBloc,List<ActorVO>?>(
                  selector: (context,bloc) => bloc.mActors,
                  builder: (context, actorsList, child) {
                    return ActorsAndCreatorsSectionView(
                        BEST_ACTORS_TITLE, BEST_ACTORS_SEE_MORE,
                        mActorList: actorsList);
                  },
                ),
                SizedBox(height: MARGIN_LARGE),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(BuildContext context, int movieId) {
    // movieModel.getMovieDetails(movieId);
    // movieModel.getMovieDetailsFromDatabase(movieId);
    // movieModel.getCreditsByMovie(movieId);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movieId),
        ));
  }
}

/*
class _HomePageState extends State<HomePage> {
  MovieModel? mMovieModel = MovieModelImpl();


  @override
  void initState() {
    super.initState();

    ///Now Playing Movies
    // mMovieModel?.getNowPlayingMovies(1)?.then((movieList) {
    //   setState(() {
    //     mNowPlayingMovieList = movieList;
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Now Playing Movies Database
    // mMovieModel?.getNowPlayingMoviesFromDatabase()?.listen((movieList) {
    //   setState(() {
    //     mNowPlayingMovieList = movieList;
    //   });
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });

    ///Popular Movies
    // mMovieModel?.getPopularMovies(1)?.then((movieList) {
    //   setState(() {
    //     mPopularMovieList = movieList.take(7).toList();
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Popular Movies Database
    // mMovieModel?.getPopularMoviesFromDatabase()?.listen((movieList) {
    //   setState(() {
    //     mPopularMovieList = movieList.take(7).toList();
    //   });
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });

    ///Showcases
    // mMovieModel?.getTopRatedMovies(1)?.then((movieList) {
    //   setState(() {
    //     mShowCaseMoviesList = movieList;
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Showcase Database
    // mMovieModel?.getTopRatedMoviesFromDatabase()?.listen((movieList) {
    //   setState(() {
    //     mShowCaseMoviesList = movieList;
    //   });
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });

    ///Genres
    // mMovieModel?.getGenres()?.then((genreList) {
    //   setState(() {
    //     mGenresList = genreList;
    //     int genreId = mGenresList?.first?.id ?? 0;
    //
    //     ///Movies by Genre
    //     _getMovieByGenreAndRefresh(genreId);
    //
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Genres Database
    // mMovieModel?.getGenresFromDatabase()?.then((genreList) {
    //   setState(() {
    //     mGenresList = genreList;
    //     int genreId = mGenresList?.first?.id ?? 0;
    //
    //     ///Movies by Genre
    //     _getMovieByGenreAndRefresh(genreId);
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Actors
    // mMovieModel?.getActors(1)?.then((actorList) {
    //   setState(() {
    //     mActorsList = actorList;
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });

    ///Actors Database
  //   mMovieModel?.getAllActorsFromDatabase()?.then((actorList) {
  //     setState(() {
  //     mActorsList = actorList;
  //   });
  // }).catchError((error) {
  // debugPrint(error.toString());
  // });
  // }

  // void _getMovieByGenreAndRefresh(int genreId) {
  //   mMovieModel?.getMoviesByGenre(genreId)?.then((movieList) {
  //     setState(() {
  //       mMoviesByGenreList = movieList;
  //     });
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //   });
  }



  void _navigateToMovieDetailScreen(BuildContext context, int movieId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movieId),
        ));
  }

  // void _getMoviesByGenerAndRefresh(int genreId) {
  //   mMovieModel?.getMoviesByGenre(genreId)?.then((moviesByGenre) {
  //     setState(() {
  //       mMoviesByGenreList = moviesByGenre;
  //     });
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //   });
  // }
}*/

class GenreSectionView extends StatelessWidget {
  final Function(int) onTapMovie;
  final List<GenreVO> genreList;
  final List<MovieVO> moviesListByGenre;
  final Function(int) onTapGenre;

  GenreSectionView({
    required this.onTapMovie,
    required this.genreList,
    required this.moviesListByGenre,
    required this.onTapGenre,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
          ),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              onTap: (index) {
                this.onTapGenre(genreList[index].id ?? 0);
              },
              isScrollable: true,
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LSIT_TITLE_COLOR,
              tabs: genreList
                  .map((genre) => Tab(
                        child: Text("${genre.name}"),
                      ))
                  .toList(),
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(top: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM),
          child: HorizontalMovieListView(
            (movieId) {
              onTapMovie(movieId);
            },
            movieList: moviesListByGenre,
          ),
        ),
      ],
    );
  }
}

class CheckMovieShowTimeSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      padding: EdgeInsets.all(MARGIN_LARGE),
      height: SHOWTIME_SECTION_HEIGHT,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MAIN_SCREEN_CHECK_MOVIES_SHOWTIME,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_HEADING_1X,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              SeeMoreText(
                MAIN_SCREEN_SEE_MORE,
                textColor: Colors.amber,
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: BANNER_PLAY_BUTTON_SIZE,
          )
        ],
      ),
    );
  }
}

class ShowCasesSection extends StatelessWidget {
  Function(int) onTapMovie;
  final List<MovieVO>? movieList;

  ShowCasesSection(this.movieList, this.onTapMovie);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: TitleTextWithSeeMoreView(
            SHOW_CASES_TITLE,
            SHOW_CASES_SEE_MORE,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          height: SHOW_CASES_HEIGHT,
          child: (movieList != null)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  itemCount: movieList?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ShowCaseView(movieList?[index],
                        (movieId) => this.onTapMovie(movieId));
                  })
              : Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class BestPopularMoviesAndSerialsSectionView extends StatelessWidget {
  final Function onTapMovie;
  final List<MovieVO>? mNowPlayingMovieList;

  BestPopularMoviesAndSerialsSectionView(
      this.onTapMovie, this.mNowPlayingMovieList);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(MAIN_SCREEN_BEST_POPULAR_MOVIES_AND_SERIALS),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        HorizontalMovieListView(
          (movieId) {
            onTapMovie(movieId);
          },
          movieList: mNowPlayingMovieList,
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int) onTapMovie;
  final List<MovieVO>? movieList;

  HorizontalMovieListView(this.onTapMovie, {this.movieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: (movieList != null)
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: MARGIN_MEDIUM),
              itemCount: movieList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return MovieView((movieId) {
                  this.onTapMovie(movieId);
                }, movieList?[index]);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  Function(int) onTapBannerView;
  final List<MovieVO>? movieList;
  BannerSectionView(this.movieList, this.onTapBannerView);
  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: widget.movieList
                    ?.map((movie) => BannerView(movie,
                        (movieId) => this.widget.onTapBannerView(movieId)))
                    .toList() ??
                [],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        (widget.movieList?.length != 0)
            ? DotsIndicator(
                dotsCount: widget.movieList?.length ?? 1,
                position: _position,
                decorator: DotsDecorator(
                  color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
                  activeColor: PLAY_BUTTON_COLOR,
                ),
              )
            : Container(),
      ],
    );
  }
}
