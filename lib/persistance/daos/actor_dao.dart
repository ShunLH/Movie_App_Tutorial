
import 'package:hive/hive.dart';
import 'package:movie_app/persistance/hive_constants.dart';

import '../../data/vos/actor_vo.dart';

class ActorDao {
  static final ActorDao _singleton = ActorDao._internal();

  factory ActorDao(){
    return _singleton;
  }

  ActorDao._internal();

  void saveAllActors(List<ActorVO> actorList) async {
    Map<int,ActorVO> actorMap = Map.fromIterable(actorList,key:(actor) => actor.id,value:(actor) => actor);
    await getActorBox().putAll(actorMap);
  }

  List<ActorVO> getAllActors(){
    return getActorBox().values.toList();
  }

  Box<ActorVO> getActorBox() {
    return Hive.box<ActorVO>(BOX_NAME_ACTOR_VO);
  }

}