import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/celebrity_entity.dart';

class CelebrityPhotosState implements Cloneable<CelebrityPhotosState> {
  CelebrityEntity celebrityData;

  @override
  CelebrityPhotosState clone() {
    return CelebrityPhotosState()..celebrityData = celebrityData;
  }
}

CelebrityPhotosState initState(Map<String, dynamic> args) {
  return CelebrityPhotosState();
}
