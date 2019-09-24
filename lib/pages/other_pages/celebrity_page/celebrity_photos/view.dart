import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

Widget buildView(
    CelebrityPhotosState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(30),
        top: ScreenUtil().setHeight(30),
        bottom: ScreenUtil().setHeight(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///文字
        Container(
          child: Text(
            '相册',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(28),
            ),
          ),
        ),

        ///照片横向列表
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          constraints: BoxConstraints(
            maxHeight: ScreenUtil().setHeight(300),
          ),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.celebrityData.photos.length,
              itemBuilder: (context, index) => _item(state, context, index)),
        ),
      ],
    ),
  );
}

Widget _item(CelebrityPhotosState state, context, index) {
  return GestureDetector(
    onTap: () {
      NavigatorUtil.pushToImagePreviewPage(
          context, state.celebrityData.photos[index].image, BoxFit.fitWidth);
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(3)),
      child: Hero(
          transitionOnUserGestures: true,
          tag: state.celebrityData.photos[index].image,
          child: CachedNetworkImage(
              imageUrl: state.celebrityData.photos[index].image)),
    ),
  );
}
