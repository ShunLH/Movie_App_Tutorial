
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/persistance/daos/actor_dao.dart';

class ActorDaoImplMock extends ActorDao {

  Map<int,ActorVO> actorListFromDataListMock = {};

  @override
  List<ActorVO> getAllActors() {
    return actorListFromDataListMock.values.toList();
  }

  @override
  void saveAllActors(List<ActorVO> actorList) {
    actorList.forEach((actor) {
      actorListFromDataListMock[actor.id ?? 0] = actor;
    });
  }

}