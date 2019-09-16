import 'package:fish_redux/fish_redux.dart';

enum AppBarAction {
  action,
  onUpdateTitleOpacity,
  updateTitleOpacity,
}

class AppBarActionCreator {
  static Action onAction() {
    return const Action(AppBarAction.action);
  }

  ///准备更新标题透明度
  static Action onUpdateTitleOpacity(data) {
    return Action(AppBarAction.onUpdateTitleOpacity, payload: data);
  }

  ///更新标题透明度
  static Action updateTitleOpacity(data) {
    return Action(AppBarAction.updateTitleOpacity, payload: data);
  }
}
