import 'package:hive/hive.dart';
import 'package:movie_app/persistance/daos/genre_dao.dart';
import 'package:movie_app/persistance/hive_constants.dart';

import '../../../data/vos/genre_vo.dart';


class GenreDaoImpl extends GenreDao{
  static final GenreDaoImpl _singleton = GenreDaoImpl._internal();

  factory GenreDaoImpl(){
    return _singleton;
  }

  GenreDaoImpl._internal();

  @override
  void saveAllGenres(List<GenreVO> genreList) async {
    Map<int,GenreVO> genreMap = Map.fromIterable(genreList,key:(genre) => genre.id,value:(genre) => genre);
    await getGenreBox().putAll(genreMap);
  }

  @override
  List<GenreVO> getAllGenres(){
    return getGenreBox().values.toList();
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box<GenreVO>(BOX_NAME_GENRE_VO);
  }
}