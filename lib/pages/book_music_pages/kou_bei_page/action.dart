import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';

enum KouBeiAction { action, init }

class KouBeiActionCreator {
  static Action onAction() {
    return const Action(KouBeiAction.action);
  }

  ///加载数据
  static Action init(KouBeiEntity data) {
    return Action(KouBeiAction.init, payload: data);
  }
}
