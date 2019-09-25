import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppBarState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppBarState>>{
      AppBarAction.action: _onAction,
      AppBarAction.updateTitleOpacity: _updateTitleOpacity,
    },
  );
}

AppBarState _onAction(AppBarState state, Action action) {
  final AppBarState newState = state.clone();
  return newState;
}

AppBarState _updateTitleOpacity(AppBarState state, Action action) {
  final AppBarState newState = state.clone();
  newState.titleOpacity = action.payload;
  return newState;
}
