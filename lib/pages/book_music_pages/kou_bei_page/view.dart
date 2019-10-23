import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view_with_nav_bar.dart';

import 'state.dart';

Widget buildView(
    KouBeiState state, Dispatch dispatch, ViewService viewService) {
  if (state.itemList == null) {
    return SkeletonViewWithNavBar();
  }

  ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    body: CustomScrollView(
      controller: state.scrollController,
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        ///伸缩appBar
        viewService.buildComponent('appBar'),

        ///多少部可播放的头部
        viewService.buildComponent('topHeader'),

        ///吸顶头部
        viewService.buildComponent('persistentHeader'),

        ///电影列表
        SliverList(
          delegate: SliverChildBuilderDelegate(
            adapter.itemBuilder,
            childCount: adapter.itemCount,
          ),
        )
      ],
    ),
  );
}
