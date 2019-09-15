import 'package:fish_redux/fish_redux.dart';

enum KouBeiAction { action, init }

class KouBeiActionCreator {
  static Action onAction() {
    return const Action(KouBeiAction.action);
  }

  ///更新数据
  static Action init() {
    return const Action(KouBeiAction.init);
  }
}
