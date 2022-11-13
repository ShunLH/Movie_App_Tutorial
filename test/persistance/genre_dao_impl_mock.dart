import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/persistance/daos/genre_dao.dart';

class GenreDaoImplMock extends GenreDao {

  Map<int,GenreVO> genresListFromDataListMock = {};

  @override
  List<GenreVO> getAllGenres() {
    return genresListFromDataListMock.values.toList();
  }

  @override
  void saveAllGenres(List<GenreVO> genreList) {
    genreList.forEach((genre) {
      genresListFromDataListMock[genre.id ?? 0] = genre;
    });
  }

}