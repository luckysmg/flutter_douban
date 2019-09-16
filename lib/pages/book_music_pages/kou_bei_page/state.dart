import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'app_bar_component/state.dart';

class KouBeiState implements Cloneable<KouBeiState> {
  ScrollController scrollController;
  var titleOpacity;
  String data;

  @override
  KouBeiState clone() {
    return KouBeiState()
      ..scrollController = scrollController
      ..titleOpacity = titleOpacity
      ..data = data;
  }
}

KouBeiState initState(Map<String, dynamic> args) {
  ScrollController scrollController = ScrollController();
  KouBeiState kouBeiState = KouBeiState();
  kouBeiState.scrollController = scrollController;
  kouBeiState.titleOpacity = 0.0;
  return kouBeiState;
}

class AppBarConnector extends ConnOp<KouBeiState, AppBarState> {
  @override
  AppBarState get(KouBeiState state) {
    final AppBarState newSubState = AppBarState();
    newSubState.titleOpacity = state.titleOpacity;
    return newSubState;
  }

  @override
  void set(KouBeiState state, AppBarState subState) {
    state.titleOpacity = subState.titleOpacity;
  }
}
