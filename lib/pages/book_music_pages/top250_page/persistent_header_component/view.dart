import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/delegate/sliver_header_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

Widget buildView(
    PersistentHeaderState state, Dispatch dispatch, ViewService viewService) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: SliverHeaderDelegate(
      minHeight: ScreenUtil().setHeight(80),
      maxHeight: ScreenUtil().setHeight(80),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(20),
            horizontal: ScreenUtil().setWidth(20)),
        child: Row(
          children: <Widget>[
            ///左边部分
            Expanded(
              child: Text(
                '片单列表 · 共250部',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20), color: Colors.black54),
              ),
            ),

            ///右边部分
            Row(
              children: <Widget>[
                ///更新时间
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(160),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text('更新时间 09-20',
                      style: TextStyle(fontSize: ScreenUtil().setSp(18))),
                ),

                ///分割线
                Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                      right: ScreenUtil().setWidth(20)),
                  height: ScreenUtil().setHeight(20),
                  width: ScreenUtil().setWidth(2),
                  color: Colors.black26,
                ),
                Icon(
                  Icons.find_replace,
                  size: ScreenUtil().setHeight(24),
                ),
                Text(
                  '筛选',
                  style: TextStyle(fontSize: ScreenUtil().setSp(21)),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
