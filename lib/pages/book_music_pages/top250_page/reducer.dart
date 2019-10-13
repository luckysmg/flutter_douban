import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<Top250State> buildReducer() {
  return asReducer(
    <Object, Reducer<Top250State>>{
      Top250Action.action: _onAction,
      Top250Action.init: _init,
      Top250Action.loadMore: _loadMore,
    },
  );
}

Top250State _onAction(Top250State state, Action action) {
  final Top250State newState = state.clone();
  return newState;
}

Top250State _init(Top250State state, Action action) {
  final Top250State newState = state.clone();
  newState.list = action.payload;
  return newState;
}

Top250State _loadMore(Top250State state, Action action) {
  int oldItemCount = action.payload[1];
  int count = state.count;
  int totalCount = action.payload[2];

  final Top250State newState = state.clone();
  newState.currentPage++;
  newState.list.addAll(action.payload[0]);

  ///这个是判断是否是最后一页的，实际不会这么复杂
  if (oldItemCount + count >= totalCount) {
    state.controller.loadNoData();
  } else {
    state.controller.loadComplete();
  }
  return newState;
}
