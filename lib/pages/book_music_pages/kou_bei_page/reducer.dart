import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<KouBeiState> buildReducer() {
  return asReducer(
    <Object, Reducer<KouBeiState>>{
      KouBeiAction.action: _onAction,
      KouBeiAction.init: _init
    },
  );
}

KouBeiState _onAction(KouBeiState state, Action action) {
  final KouBeiState newState = state.clone();
  return newState;
}

KouBeiState _init(KouBeiState state, Action action) {
  final KouBeiState newState = state.clone();
  newState.itemList = action.payload;
  return newState;
}
