import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/kou_bei_list_adapter/kou_bei_list_item_component/state.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/persistent_header_component/state.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/top_header_component/state.dart';

import 'app_bar_component/state.dart';

class KouBeiState implements Cloneable<KouBeiState> {
  ScrollController scrollController;
  var titleOpacity;
  List<KouBeiListItemState> itemList;

  @override
  KouBeiState clone() {
    return KouBeiState()
      ..scrollController = scrollController
      ..titleOpacity = titleOpacity
      ..itemList = itemList;
  }
}

KouBeiState initState(Map<String, dynamic> args) {
  ScrollController scrollController = ScrollController();
  KouBeiState kouBeiState = KouBeiState();
  kouBeiState.scrollController = scrollController;
  kouBeiState.titleOpacity = 0.0;
  return kouBeiState;
}

///appBar组件连接器
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

///header连接器
class TopHeaderConnector extends ConnOp<KouBeiState, TopHeaderState> {
  @override
  TopHeaderState get(KouBeiState state) {
    return null;
  }

  @override
  void set(KouBeiState state, TopHeaderState subState) {}
}

///吸顶头部连接器
class PersistentHeaderConnector
    extends ConnOp<KouBeiState, PersistentHeaderState> {
  @override
  PersistentHeaderState get(KouBeiState state) {
    return null;
  }

  @override
  void set(KouBeiState state, PersistentHeaderState subState) {}
}
