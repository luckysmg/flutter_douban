import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/other_pages/movie_detail_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    Top250ListItemState state, Dispatch dispatch, ViewService viewService) {
  String country;
  try {
    country = state.data.pubdates.last
        .substring(11, state.data.pubdates.last.length - 1);
  } catch (e) {
    country = state.data.pubdates.last
        .substring(5, state.data.pubdates.last.length - 1);
  }

  ///类型
  String type = '';
  state.data.genres.forEach((item) {
    type += item + ' ';
  });

  ///导演
  String directors = '';
  state.data.directors.forEach((item) {
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
            color: Colors.orange,
          ),
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(5),
              horizontal: ScreenUtil().setWidth(12)),
          child: Text('No.${state.pos}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),

        ///中间的主体部分
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    NavigatorUtil.push(
                        viewService.context,
                        MovieDetailPage(
                          movieId: state.data.id,
                          isComingSoon: false,
                        ));
                  },
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
                            imageUrl: state.data.images.medium,
                          ),
                        ),
                      ),

                      ///电影图片右边的文字信息的布局
                      Container(
                        margin:
                            EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ///电影名字
                            Container(
                              child: Text(
                                state.data.title,
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
                                      state.data.rating.average / 10.0 * 5.0,
                                  itemPadding: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(2),
                                  ),
                                ),

                                ///评分数字
                                Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(10)),
                                  child: Text(
                                    state.data.rating.average.toString(),
                                  ),
                                ),
                              ],
                            ),

                            ///其他介绍 韩国/动作 灾难...
                            Container(
                              width: ScreenUtil().setWidth(390),
                              child: Text(
                                '$country / $type / $directors',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///分割线
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(2),
                color: Colors.black12,
              ),

              GestureDetector(
                onTap: () {
                  ToastUtil.show('想看');
                },
                child: Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        child: Image.asset(
                          Constants.ASSETS_IMG + 'ic_info_wish.png',
                          height: ScreenUtil().setHeight(30),
                        ),
                      ),
                      Text('想看', style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        Container(
            alignment: Alignment.centerLeft,
            height: ScreenUtil().setHeight(50),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            width: double.infinity,
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black12),
            child: Text('${state.data.collectCount}人评价')),
      ],
    ),
  );
}
