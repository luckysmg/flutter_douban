import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CelebrityState> buildReducer() {
  return asReducer(
    <Object, Reducer<CelebrityState>>{
      CelebrityAction.action: _onAction,
      CelebrityAction.init: _init,
    },
  );
}

CelebrityState _onAction(CelebrityState state, Action action) {
  final CelebrityState newState = state.clone();
  return newState;
}

CelebrityState _init(CelebrityState state, Action action) {
  final CelebrityState newState = state.clone();
  newState.celebrityData = action.payload[0];
  newState.celebrityWorksData = action.payload[1];
  return newState;
}
