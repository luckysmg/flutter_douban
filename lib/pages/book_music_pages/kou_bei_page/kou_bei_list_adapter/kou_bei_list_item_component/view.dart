import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    KouBeiListItemState state, Dispatch dispatch, ViewService viewService) {
  ///显示NO.1 2 3时候的颜色区分
  Color color;
  if (state.data.rank == 1) {
    color = Colors.red;
  } else if (state.data.rank == 2) {
    color = Colors.orange;
  } else if (state.data.rank == 3) {
    color = Colors.orange[200];
  } else {
    color = Colors.grey;
  }

  ///国家
  String country = state.data.subject.pubdates.last
      .substring(11, state.data.subject.pubdates.last.length - 1);

  ///类型
  String type = '';
  state.data.subject.genres.forEach((item) {
    type += item + ' ';
  });

  ///导演
  String directors = '';
  state.data.subject.directors.forEach((item) {
    directors += item.name + ' ';
  });

  return Container(
    padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(20),
        horizontal: ScreenUtil().setWidth(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///No.1的牌子
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(5),
              horizontal: ScreenUtil().setWidth(12)),
          child: Text('No.${state.data.rank}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),

        ///中间的主体部分
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ///电影图片
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    height: ScreenUtil().setHeight(200),
                    fadeInDuration: const Duration(milliseconds: 400),
                    imageUrl: state.data.subject.images.medium,
                  ),
                ),
              ),

              ///电影图片右边的文字信息的布局
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ///电影名字
                    Container(
                      child: Text(
                        state.data.subject.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(30),
                        ),
                      ),
                    ),

                    ///星级的星星以及评分
                    Row(
                      children: <Widget>[
                        ///星星
                        FlutterRatingBarIndicator(
                          itemSize: ScreenUtil().setHeight(15),
                          emptyColor: Colors.grey,
                          rating:
                              state.data.subject.rating.average / 10.0 * 5.0,
                          itemPadding: EdgeInsets.only(
                            right: ScreenUtil().setWidth(2),
                          ),
                        ),

                        ///评分数字
                        Container(
                          margin:
                              EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                          child: Text(
                            state.data.subject.rating.average.toString(),
                          ),
                        ),
                      ],
                    ),

                    ///其他介绍 韩国/动作 灾难...
                    Text('$country / $type / $directors')
                  ],
                ),
              ),

              ///分割线
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(2),
                color: Colors.black12,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
