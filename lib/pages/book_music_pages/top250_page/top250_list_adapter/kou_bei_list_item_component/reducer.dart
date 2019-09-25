import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<Top250ListItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<Top250ListItemState>>{
      Top250ListItemAction.action: _onAction,
    },
  );
}

Top250ListItemState _onAction(Top250ListItemState state, Action action) {
  final Top250ListItemState newState = state.clone();
  return newState;
}
