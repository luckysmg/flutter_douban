import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/widgets/common_widgets/refresh_footer.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    Top250State state, Dispatch dispatch, ViewService viewService) {
  if (state.list == null) {
    return SkeletonView();
  }

  ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    body: EasyRefresh.custom(
      onLoad: () async {
        if (Constants.isRealNetworkData) {
          await dispatch(Top250ActionCreator.onLoadMore(adapter.itemCount));
        } else {
          await Future.delayed(Duration(milliseconds: 1000));
          state.easyRefreshController.finishLoad(noMore: true);
        }
      },
      enableControlFinishLoad: true,
      footer: RefreshFooter(),
      controller: state.easyRefreshController,
      scrollController: state.scrollController,
      slivers: <Widget>[
        ///伸缩appBar
        viewService.buildComponent('appBar'),

        ///多少部可播放的头部
        viewService.buildComponent('topHeader'),

        ///吸顶头部
        viewService.buildComponent('persistentHeader'),

        ///电影列表
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(adapter.itemBuilder,
              childCount: adapter.itemCount),
          itemExtent: ScreenUtil().setHeight(360),
        ),
      ],
    ),
  );
  ;
}
