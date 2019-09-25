import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/top250_entity.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/app_bar_component/action.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top250_list_adapter/kou_bei_list_item_component/state.dart';
import 'package:flutter_douban/util/constants.dart';
import 'action.dart';
import 'state.dart';

Effect<Top250State> buildEffect() {
  return combineEffects(<Object, Effect<Top250State>>{
    Top250Action.action: _onAction,
    Top250Action.onLoadMore: _onLoadMore,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}

void _onAction(Action action, Context<Top250State> ctx) {}

void _onInit(Action action, Context<Top250State> ctx) async {
  ///设置滚动监听
  ctx.state.scrollController.addListener(() {
    ctx.dispatch(AppBarActionCreator.onUpdateTitleOpacity(
        ctx.state.scrollController.offset));
  });

  List<Top250ListItemState> list = List();
  Top250Entity entity;
  int pos = 1;

  if (Constants.isRealNetworkData) {
    await DioUtil.getInstance().get(
        url: Constants.URL_REAL_TOP250,
        queryParameters: {
          'start': ctx.state.currentPage,
          'count': ctx.state.count
        }).then((data) {
      entity = Top250Entity.fromJson(data);
    });
  } else {
    await MockRequest.mock('current_top250').then((data) {
      entity = Top250Entity.fromJson(data);
    });

    await Future.delayed(Duration(milliseconds: 1200));
  }
  entity.subjects.forEach((item) {
    Top250ListItemState itemState = Top250ListItemState();
    itemState.data = item;
    itemState.pos = pos;
    pos++;
    list.add(itemState);
  });

  ctx.dispatch(Top250ActionCreator.init(list));
}

Future<void> _onLoadMore(Action action, Context<Top250State> ctx) async {
  int pos = 1;
  int currentItemCount = action.payload;
  Top250Entity entity;
  List<Top250ListItemState> list = List();
  await DioUtil.getInstance().get(
      url: Constants.URL_REAL_TOP250,
      queryParameters: {
        'start': ctx.state.currentPage + 1,
        'count': ctx.state.count
      }).then((data) {
    entity = Top250Entity.fromJson(data);
  });

  entity.subjects.forEach((item) {
    Top250ListItemState itemState = Top250ListItemState();
    itemState.data = item;
    itemState.pos = pos + (entity.start) * entity.count;
    pos++;
    list.add(itemState);
  });

  ctx.dispatch(
      Top250ActionCreator.loadMore([list, currentItemCount, entity.total]));
}

void _onDispose(Action action, Context<Top250State> ctx) {
  ctx.state.scrollController.dispose();
}
