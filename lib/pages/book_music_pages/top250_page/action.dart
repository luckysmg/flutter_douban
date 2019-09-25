import 'package:fish_redux/fish_redux.dart';

enum Top250Action { action, init, onLoadMore, loadMore }

class Top250ActionCreator {
  static Action onAction() {
    return const Action(Top250Action.action);
  }

  static Action init(data) {
    return Action(Top250Action.init, payload: data);
  }

  static Action onLoadMore(data) {
    return Action(Top250Action.onLoadMore, payload: data);
  }

  static Action loadMore(data) {
    return Action(Top250Action.loadMore, payload: data);
  }
}
