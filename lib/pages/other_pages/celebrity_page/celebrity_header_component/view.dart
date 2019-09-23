import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/routes/transparent_page_route.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

Widget buildView(
    CelebrityHeaderState state, Dispatch dispatch, ViewService viewService) {
  ///中文名
  var nameText = Container(
    child: Text(
      state.name,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold),
    ),
  );

  var nameEnText = Container(
    margin: EdgeInsets.only(
      top: ScreenUtil().setHeight(15),
    ),
    child: Text(
      state.nameEn,
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(24)),
    ),
  );

  var focusCount = Container(
    margin: EdgeInsets.only(
      top: ScreenUtil().setHeight(15),
    ),
    child: Text(
      '7652人关注',
      style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(18)),
    ),
  );

  var greenButton = Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
    child: CupertinoButton(
        borderRadius: BorderRadius.circular(5),
        minSize: ScreenUtil().setHeight(50),
        child: Text('关注', style: TextStyle(color: Colors.white)),
        color: Colors.green,
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(60),
            vertical: ScreenUtil().setHeight(0)),
        onPressed: () {
          ToastUtil.show('关注成功');
        }),
  );

  var photo = ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 400),
      placeholder: (context, string) {
        return Container(
          color: Colors.grey,
          height: ScreenUtil().setHeight(200),
          width: ScreenUtil().setWidth(170),
        );
      },
      imageUrl: state.photoUrl,
      height: ScreenUtil().setHeight(200),
    ),
  );

  var column = Container(
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20), top: ScreenUtil().setHeight(5)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        nameText,
        nameEnText,
        focusCount,
        greenButton,
      ],
    ),
  );

  var row = Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      photo,
      column,
    ],
  );

  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setHeight(20)),
    child: row,
  );
}
