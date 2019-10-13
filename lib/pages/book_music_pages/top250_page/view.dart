import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/widgets/common_widgets/custom_footer_indicator.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    Top250State state, Dispatch dispatch, ViewService viewService) {
  if (state.list == null) {
    return SkeletonView();
  }

  ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    body: SmartRefresher(
      physics: BouncingScrollPhysics(),
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () async {
        if (Constants.isRealNetworkData) {
          print('loading');
          await dispatch(Top250ActionCreator.onLoadMore(adapter.itemCount));
        } else {
          await Future.delayed(Duration(milliseconds: 1000));
          state.controller.loadNoData();
        }
      },
      footer: CustomFooterIndicator(),
      controller: state.controller,
      child: CustomScrollView(
        controller: state.scrollController,
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
    ),
  );
  ;
}
