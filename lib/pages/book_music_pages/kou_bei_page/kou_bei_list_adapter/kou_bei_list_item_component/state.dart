import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';

class KouBeiListItemState implements Cloneable<KouBeiListItemState> {
  KouBeiSubject data;

  @override
  KouBeiListItemState clone() {
    return KouBeiListItemState()..data = data;
  }
}

KouBeiListItemState initState(Map<String, dynamic> args) {
  return KouBeiListItemState();
}
