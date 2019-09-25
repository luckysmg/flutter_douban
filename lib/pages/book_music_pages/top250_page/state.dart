import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/app_bar_component/state.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/persistent_header_component/state.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top250_list_adapter/kou_bei_list_item_component/state.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top_header_component/state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Top250State implements Cloneable<Top250State> {
  ScrollController scrollController;
  EasyRefreshController easyRefreshController;
  var titleOpacity;
  List<Top250ListItemState> list;
  var currentPage;
  var count;

  @override
  Top250State clone() {
    return Top250State()
      ..scrollController = scrollController
      ..easyRefreshController = easyRefreshController
      ..titleOpacity = titleOpacity
      ..list = list
      ..currentPage = currentPage
      ..count = count;
  }
}

Top250State initState(Map<String, dynamic> args) {
  ScrollController scrollController = ScrollController();
  EasyRefreshController easyRefreshController = EasyRefreshController();
  Top250State top250state = Top250State();
  top250state.scrollController = scrollController;
  top250state.easyRefreshController = easyRefreshController;
  top250state.titleOpacity = 0.0;
  top250state.currentPage = 0;
  top250state.count = 25;
  return top250state;
}

///appBar组件连接器
class AppBarConnector extends ConnOp<Top250State, AppBarState> {
  @override
  AppBarState get(Top250State state) {
    final AppBarState newSubState = AppBarState();
    newSubState.titleOpacity = state.titleOpacity;
    return newSubState;
  }

  @override
  void set(Top250State state, AppBarState subState) {
    state.titleOpacity = subState.titleOpacity;
  }
}

///header连接器
class TopHeaderConnector extends ConnOp<Top250State, TopHeaderState> {
  @override
  TopHeaderState get(Top250State state) {
    return null;
  }

  @override
  void set(Top250State state, TopHeaderState subState) {}
}

///吸顶头部连接器
class PersistentHeaderConnector
    extends ConnOp<Top250State, PersistentHeaderState> {
  @override
  PersistentHeaderState get(Top250State state) {
    return null;
  }

  @override
  void set(Top250State state, PersistentHeaderState subState) {}
}
