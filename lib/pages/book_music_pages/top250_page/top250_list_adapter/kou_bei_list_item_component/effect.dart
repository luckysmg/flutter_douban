import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<Top250ListItemState> buildEffect() {
  return combineEffects(<Object, Effect<Top250ListItemState>>{
    Top250ListItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<Top250ListItemState> ctx) {}
