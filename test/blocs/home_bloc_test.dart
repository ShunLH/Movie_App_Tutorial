import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/blocs/home_bloc.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';

import '../data/models/movie_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Home Bloc Test", () {
    HomeBloc? homeBloc;

    setUp(() => {homeBloc = HomeBloc(MovieModelImplMock())});

    test("Fetch Now Playing movies test", () {
      expect(
          homeBloc?.mNowPlayingMoviesList
              ?.contains(getMockMoviesForTest().first),
          true);
    });

    test("Fetch Popular movies test", () {
      expect(
          homeBloc?.mPopularMoviesList
              ?.contains(getMockMoviesForTest()[1]),
          true);
    });

    test("Fetch Top Rated movies test", () {
      expect(
          homeBloc?.mShowcaseMoviesList
              ?.contains(getMockMoviesForTest().last),
          true);
    });

    test("Fetch Genres test", () {
      expect(
          homeBloc?.mGenreList
              ?.contains(getMockGenres().first),
          true);
    });


    test("Fetch Initial movies By Genres test", () async{
      homeBloc?.onTapGenre(3);
      await Future.delayed(Duration(microseconds: 500));
      expect(
          homeBloc?.mMoviesByGenreList
              ?.contains(getMockMoviesForTest().last),
          true);
    });

    test("Fetch Actors test" , () {
      expect(homeBloc?.mActors?.contains(getMockActors().first),true);
    });



  });
}
