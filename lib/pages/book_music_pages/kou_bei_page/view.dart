import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_grid_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    KouBeiState state, Dispatch dispatch, ViewService viewService) {
//  if (state.data == null) {
//    return SkeletonView();
//  }
  return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        _appBar(state, dispatch, viewService),
      ],
    ),
  );
}

///appBar
Widget _appBar(state, Dispatch dispatch, ViewService viewService) {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    pinned: true,
    floating: true,
    centerTitle: true,
    actions: <Widget>[
      Container(
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
          child: Icon(
            Icons.more_horiz,
            size: ScreenUtil().setHeight(40),
          )),
    ],
    expandedHeight: ScreenUtil().setHeight(300),
    leading: Icon(
      Icons.arrow_back_ios,
    ),
    flexibleSpace: AnimatedOpacity(
      opacity: 0.8,
      duration: const Duration(milliseconds: 0),
      child: Image.asset(
        Constants.ASSETS_IMG + 'bg_kou_bei.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );
}
