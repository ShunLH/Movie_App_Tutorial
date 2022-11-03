import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/responses/get_credits_by_movie_response.dart';
import 'package:movie_app/network/responses/get_actor_response.dart';
import 'package:movie_app/network/responses/get_genres_response.dart';
import 'package:movie_app/network/responses/get_now_playing_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'package:retrofit/http.dart';
part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<MovieListResponse> getNowPlayingMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_POPULAR)
  Future<MovieListResponse> getPopularMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_TOP_RATED)
  Future<MovieListResponse> getTopRatedMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_GENRES)
  Future<GetGenresResponse> getGenres(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );

  // @GET('$ENDPOINT_GET_MOVIES_BY_GENRES/{genre_id}')
  // Future<GetMoviesByGenreResponse> getMoviesByGenre(
  //     @Path('genre_id') String genreId,
  //     @Query(PARAM_API_KEY) String apiKey,
  //     @Query(PARAM_LANGUAGE) String language,
  //     );
  @GET(ENDPOINT_GET_MOVIES_BY_GENRES)
  Future<MovieListResponse> getMoviesByGenre(
    @Query(PARAM_GENRE_ID) String genreId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );

  @GET(ENDPOINT_GET_ACTORS)
  Future<GetActorResponse> getActors(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET('$ENDPOINT_GET_MOVIE_DETAIL/{movie_id}')
  Future<MovieVO> getMovieDetail(
    @Path('movie_id') String movieId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET('$ENDPOINT_GET_CREDITS_BY_MOVIE/{movie_id}/credits')
  Future<GetCreditsByMovieResponse> getCreditsByMovie(
    @Path('movie_id') String movieId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

}
