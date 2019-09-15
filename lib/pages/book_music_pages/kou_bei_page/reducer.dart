import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<KouBeiState> buildReducer() {
  return asReducer(
    <Object, Reducer<KouBeiState>>{
      KouBeiAction.action: _onAction,
    },
  );
}

KouBeiState _onAction(KouBeiState state, Action action) {
  final KouBeiState newState = state.clone();
  return newState;
}
