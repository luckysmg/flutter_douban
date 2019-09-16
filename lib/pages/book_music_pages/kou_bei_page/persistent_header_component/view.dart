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
                '片单列表 · 共9部',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20), color: Colors.black54),
              ),
            ),

            ///右边部分
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(160),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text('更新时间 09-13',
                      style: TextStyle(fontSize: ScreenUtil().setSp(18))),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
