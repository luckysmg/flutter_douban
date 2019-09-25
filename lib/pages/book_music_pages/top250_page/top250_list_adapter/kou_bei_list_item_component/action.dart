import 'package:fish_redux/fish_redux.dart';

enum Top250ListItemAction { action }

class Top250ListItemActionCreator {
  static Action onAction() {
    return const Action(Top250ListItemAction.action);
  }
}
