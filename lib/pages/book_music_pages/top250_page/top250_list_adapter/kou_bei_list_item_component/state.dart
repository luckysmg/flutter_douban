import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/top250_entity.dart';

class Top250ListItemState implements Cloneable<Top250ListItemState> {
  Top250Subject data;
  int pos;

  @override
  Top250ListItemState clone() {
    return Top250ListItemState()
      ..data = data
      ..pos = pos;
  }
}

Top250ListItemState initState(Map<String, dynamic> args) {
  return Top250ListItemState();
}
