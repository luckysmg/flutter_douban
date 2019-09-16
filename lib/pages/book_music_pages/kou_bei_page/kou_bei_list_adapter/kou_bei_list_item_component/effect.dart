import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<KouBeiListItemState> buildEffect() {
  return combineEffects(<Object, Effect<KouBeiListItemState>>{
    KouBeiListItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<KouBeiListItemState> ctx) {
}
