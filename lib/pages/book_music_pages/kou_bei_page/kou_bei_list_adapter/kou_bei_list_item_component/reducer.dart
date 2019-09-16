import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<KouBeiListItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<KouBeiListItemState>>{
      KouBeiListItemAction.action: _onAction,
    },
  );
}

KouBeiListItemState _onAction(KouBeiListItemState state, Action action) {
  final KouBeiListItemState newState = state.clone();
  return newState;
}
