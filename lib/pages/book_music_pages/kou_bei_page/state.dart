import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';

class KouBeiState implements Cloneable<KouBeiState> {
  KouBeiEntity data;

  @override
  KouBeiState clone() {
    return KouBeiState()..data = data;
  }
}

KouBeiState initState(Map<String, dynamic> args) {
  KouBeiState kouBeiState = KouBeiState();
  return kouBeiState;
}
