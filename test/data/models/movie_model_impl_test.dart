import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

import '../../mock_data/mock_data.dart';
import '../../network/movie_data_agent_impl_mock.dart';
import '../../persistance/actor_dao_impl_mock.dart';
import '../../persistance/genre_dao_impl_mock.dart';
import '../../persistance/movie_dao_impl_mock.dart';

void main() {

  group("movie_model_impl", () {
    var movieModel = MovieModelImpl();


    setUp(() {
      movieModel.setDaosAndDataAgents(MovieDaoImplMock(), GenreDaoImplMock(),
          ActorDaoImplMock(), MovieDataAgentImplMock());
    });

    test(
        "Saving Now Playing Movies and Getting Now Playing Movies from Database",
        () {
      expect(
          movieModel.getNowPlayingMoviesFromDatabase(),
          emits([
            MovieVO(
                false,
                "/y5Z0WesTjvn59jP6yo459eUsbli.jpg",
                [878, 28],
                null,
                null,
                null,
                null,
                580489,
                null,
                "en",
                "Terrifier 2",
                "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
                1.677,
                "/b6IRp6Pl2Fsq37r9jFhGoLtaqHm.jpg",
                null,
                null,
                "2022-11-11",
                null,
                null,
                null,
                "Terrifier 2",
                null,
                "Terrifier 2",
                false,
                7.5,
                292,
                true,
                false,
                false),
          ]));
    });

    test("Saving Popular Movies and Getting Popular Movies from Database", () {
      expect(
          movieModel.getPopularMoviesFromDatabase(),
          emits([
            MovieVO(
                false,
                "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                [28, 14, 878],
                null,
                null,
                null,
                null,
                436270,
                null,
                "en",
                "Black Adam",
                "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                3157.143,
                "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
                null,
                null,
                "2022-10-19",
                null,
                null,
                null,
                "Terrifier 2",
                null,
                "Terrifier 2",
                false,
                6.8,
                280,
                false,
                true,
                false),
          ]));
    });

    test("Saving TopRated Movies and Getting TopRated Movies from Database",
        () {
      expect(
        movieModel.getTopRatedMoviesFromDatabase(),
          emits([
            MovieVO(
                false,
                "/mqsPyyeDCBAghXyjbw4TfEYwljw.jpg",
                [10752, 18, 28],
                null,
                null,
                null,
                null,
                49046,
                null,
                "en",
                "Im Westen nichts Neues",
                "Paul Baumer and his friends Albert and Muller, egged on by romantic dreams of heroism, voluntarily enlist in the German army. Full of excitement and patriotic fervour, the boys enthusiastically march into a war they believe in. But once on the Western Front, they discover the soul-destroying horror of World War I.",
                2340.74,
                "/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg",
                null,
                null,
                "2022-10-07",
                null,
                null,
                null,
                "All Quiet on the Western Front",
                null,
                "Im Westen nichts Neues",
                false,
                7.9,
                666,
                false,
                false,
                true),
          ]));
    });

    test("Get Genre", () {
      expect(
          movieModel.getGenres(),
          completion(
            equals(getMockGenres()),
          ));
    });

    test("Get Actor Test", () {
      expect(
          movieModel.getActors(1),
          completion(
            equals(getMockActors()),
          ));
    });

    test("Get Credits Test", () {
      expect(
          movieModel.getCreditsByMovie(1),
          completion(
            equals(getMockCredits()),
          ));
    });

    test("Get MovieDetails Test", () {
      expect(
          movieModel.getMovieDetails(1),
          completion(
            equals(getMockMoviesForTest().first),
          ));
    });

    test("Get MovieDetails from Database Test", () async{
      await movieModel.getMovieDetails(1);
      expect(
          movieModel.getMovieDetailsFromDatabase(1),
          completion(
            equals(getMockMoviesForTest().first),
          ));
    });

    test("Get Actors from Database Test", () async{
      await movieModel.getActors(1);
      expect(
          movieModel.getAllActorsFromDatabase(),
          completion(
            equals(getMockActors()),
          ));
    });

    test("Get Genres from Database Test", () async{
      await movieModel.getGenres();
      expect(
          movieModel.getGenresFromDatabase(),
          completion(
            equals(getMockGenres()),
          ));
    });
    

  });
}
