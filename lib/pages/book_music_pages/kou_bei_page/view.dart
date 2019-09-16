import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    KouBeiState state, Dispatch dispatch, ViewService viewService) {
//  if (state.data == null) {
//    return SkeletonView();
//  }

  return Scaffold(
    body: CustomScrollView(
      controller: state.scrollController,
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        ///伸缩appBar
        viewService.buildComponent('appBar'),

        SliverList(
          delegate: SliverChildListDelegate(
            [
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
              Text('haha'),
            ],
          ),
        )
      ],
    ),
  );
}
