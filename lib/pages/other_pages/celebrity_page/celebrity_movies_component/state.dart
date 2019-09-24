import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/celebrity_entity.dart';

class CelebrityMoviesState implements Cloneable<CelebrityMoviesState> {
  CelebrityEntity celebrityData;

  @override
  CelebrityMoviesState clone() {
    return CelebrityMoviesState()..celebrityData = celebrityData;
  }
}

CelebrityMoviesState initState(Map<String, dynamic> args) {
  return CelebrityMoviesState();
}
