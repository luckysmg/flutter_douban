import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

Widget buildView(CelebrityBriefIntroductionState state, Dispatch dispatch,
    ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///简介的头
        Container(
          child: Text(
            '简介',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(28),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              right: ScreenUtil().setWidth(30),
              top: ScreenUtil().setHeight(15)),
          child: Text(
            state.briefIntroduction,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
            ),
          ),
        )
      ],
    ),
  );
}
