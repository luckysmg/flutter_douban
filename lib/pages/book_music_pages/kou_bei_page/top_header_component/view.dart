import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

Widget buildView(
    TopHeaderState state, Dispatch dispatch, ViewService viewService) {
  return SliverToBoxAdapter(
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(24),
              horizontal: ScreenUtil().setWidth(20)),
          child: Row(
            children: <Widget>[
              Image.asset(
                Constants.ASSETS_IMG + 'ic_action_playable_video_s.png',
                height: ScreenUtil().setHeight(35),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      child: Text('1部可播放'))),
              Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                  child: Text('可播放 >')),
            ],
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(2),
          width: double.infinity,
          color: Colors.grey[200],
        )
      ],
    ),
  );
}
