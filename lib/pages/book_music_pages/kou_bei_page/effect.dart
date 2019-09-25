import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/kou_bei_list_adapter/kou_bei_list_item_component/state.dart';
import 'package:flutter_douban/util/constants.dart';

import 'action.dart';
import 'app_bar_component/action.dart';
import 'state.dart';

Effect<KouBeiState> buildEffect() {
  return combineEffects(<Object, Effect<KouBeiState>>{
    KouBeiAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}

void _onAction(Action action, Context<KouBeiState> ctx) {}

///设置滚动监听器，获取数据
void _onInit(Action action, Context<KouBeiState> ctx) async {
  ///设置滚动监听
  ctx.state.scrollController.addListener(() {
    ctx.dispatch(AppBarActionCreator.onUpdateTitleOpacity(
        ctx.state.scrollController.offset));
  });

  if (Constants.isRealNetworkData) {
    DioUtil.getInstance().get(url: Constants.URL_HTTP_KOU_BEI).then((data) {
      KouBeiEntity entity = KouBeiEntity.fromJson(data);
      List<KouBeiListItemState> list = List();
      entity.subjects.forEach((item) {
        KouBeiListItemState kouBeiListItemState = KouBeiListItemState();
        kouBeiListItemState.data = item;
        list.add(kouBeiListItemState);
      });
      ctx.dispatch((KouBeiActionCreator.init(list)));
    });
  } else {
    KouBeiEntity entity;
    List<KouBeiListItemState> list;
    await MockRequest.mock('koubei').then((data) {
      entity = KouBeiEntity.fromJson(data);
      list = List();
      entity.subjects.forEach((item) {
        KouBeiListItemState kouBeiListItemState = KouBeiListItemState();
        kouBeiListItemState.data = item;
        list.add(kouBeiListItemState);
      });
    });
    await Future.delayed(Duration(milliseconds: 1000));
    ctx.dispatch(KouBeiActionCreator.init(list));
  }
}

void _onDispose(Action action, Context<KouBeiState> ctx) {
  ctx.state.scrollController.dispose();
}
