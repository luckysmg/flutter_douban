import 'package:fish_redux/fish_redux.dart';

enum CelebrityAction { action, init }

class CelebrityActionCreator {
  static Action onAction() {
    return const Action(CelebrityAction.action);
  }

  static Action init(data) {
    return Action(CelebrityAction.init, payload: data);
  }
}
