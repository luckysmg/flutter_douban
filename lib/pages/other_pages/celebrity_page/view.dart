import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CelebrityState state, Dispatch dispatch, ViewService viewService) {
  if (state.celebrityWorksData == null || state.celebrityData == null) {
    return SkeletonView();
  }
  return Scaffold(
    appBar: CupertinoNavigationBar(
      transitionBetweenRoutes: false,
      backgroundColor: Colors.white,
      trailing: Icon(
        Icons.more_horiz,
        size: ScreenUtil().setHeight(35),
      ),
      middle: Text(state.celebrityData.name),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(viewService.context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: ScreenUtil().setHeight(30),
        ),
      ),
    ),
    body: ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        ///基本信息，头像，名字的header
        viewService.buildComponent('CelebrityHeader'),

        ///简介
        viewService.buildComponent('celebrityBriefIntroduction'),

        ///影视作品
        viewService.buildComponent('celebrityMovies'),

        ///相册
        viewService.buildComponent('celebrityPhotos'),
      ],
    ),
  );
}
