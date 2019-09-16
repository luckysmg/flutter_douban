import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum KouBeiListItemAction { action }

class KouBeiListItemActionCreator {
  static Action onAction() {
    return const Action(KouBeiListItemAction.action);
  }
}
