import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/collection_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/production_companies_vo.dart';
import 'package:movie_app/data/vos/production_countries_vo.dart';
import 'package:movie_app/data/vos/spoken_languages_vo.dart';
import 'package:movie_app/persistance/hive_constants.dart';
part 'movie_vo.g.dart';

@HiveType(typeId: HYPE_TYPE_ID_MOVIE_VO,adapterName: "MovieVOAdapter")
@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: "belongs_to_collection")
  @HiveField(3)
  CollectionVO? belongsToCollection;

  @JsonKey(name: "budget")
  @HiveField(4)
  double? budget;

  @JsonKey(name: "genres")
  @HiveField(5)
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  @HiveField(6)
  String? homePage;

  @JsonKey(name: "id")
  @HiveField(7)
  int? id;

  @JsonKey(name: "imdb_id")
  @HiveField(8)
  String? imdbId;

  @JsonKey(name: "original_language")
  @HiveField(9)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(10)
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(11)
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(12)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(13)
  String? posterPath;

  @JsonKey(name: "production_companies")
  @HiveField(14)
  List<ProductionCompaniesVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @HiveField(155)
  List<ProductionCountriesVO>? productionCountries;

  @JsonKey(name: "release_date")
  @HiveField(16)
  String? releaseDate;

  @JsonKey(name: "revenue")
  @HiveField(17)
  double? revenue;

  @JsonKey(name: "runtime")
  @HiveField(18)
  double? runtime;

  @JsonKey(name: "spoken_languages")
  @HiveField(19)
  List<SpokenLanguagesVO>? spokenLanguages;

  @JsonKey(name: "status")
  @HiveField(20)
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(21)
  String? tagline;

  @JsonKey(name: "title")
  @HiveField(22)
  String? title;

  @JsonKey(name: "video")
  @HiveField(23)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(24)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(25)
  int? voteCount;

  @HiveField(26)
  bool? isNowPlaying;

  @HiveField(27)
  bool? isPopular;

  @HiveField(28)
  bool? isTopRated;


  MovieVO(
      this.adult,
      this.backDropPath,
      this.genreIds,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homePage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.isNowPlaying,
      this.isPopular,
      this.isTopRated
      );

  factory MovieVO.fromJson(Map<String,dynamic> json) => _$MovieVOFromJson(json);
  Map<String,dynamic> toJson() => _$MovieVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          productionCountries == other.productionCountries &&
          title == other.title;

  @override
  int get hashCode =>
      id.hashCode ^ productionCountries.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homePage: $homePage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
