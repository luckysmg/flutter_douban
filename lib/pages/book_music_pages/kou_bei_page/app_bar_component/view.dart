import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

Widget buildView(
    AppBarState state, Dispatch dispatch, ViewService viewService) {
  return SliverAppBar(
    backgroundColor: Colors.green[400],
    pinned: true,
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
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(viewService.context);
      },
      child: Icon(
        Icons.arrow_back_ios,
      ),
    ),
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: AnimatedOpacity(
        opacity: state.titleOpacity,
        duration: const Duration(milliseconds: 0),
        child: Text('一周口碑电影榜'),
      ),
      background: Container(
        child: Stack(
          children: <Widget>[
            ///背景图片
            Container(
              width: double.infinity,
              child: Image.asset(
                Constants.ASSETS_IMG + 'bg_kou_bei.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),

            ///文字
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(150),
                  left: ScreenUtil().setWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '一周口碑电影榜',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(40),
                        fontWeight: FontWeight.w100),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                    child: Text(
                      '每周五更新 · 共10部',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
