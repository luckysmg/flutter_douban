import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view.dart';

import 'state.dart';

Widget buildView(
    KouBeiState state, Dispatch dispatch, ViewService viewService) {
  if (state.itemList == null) {
    return SkeletonView();
  }

  ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    body: CustomScrollView(
      controller: state.scrollController,
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        ///伸缩appBar
        viewService.buildComponent('appBar'),
        viewService.buildComponent('topHeader'),
        viewService.buildComponent('persistentHeader'),
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
