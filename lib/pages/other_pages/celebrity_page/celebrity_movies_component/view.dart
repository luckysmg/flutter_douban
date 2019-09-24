import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../movie_detail_page.dart';
import 'state.dart';

Widget buildView(
    CelebrityMoviesState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(
      top: ScreenUtil().setHeight(20),
      left: ScreenUtil().setWidth(30),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '影视',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(260)),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.celebrityData.works.length,
            itemBuilder: (context, index) => _item(state, context, index),
          ),
        ),
      ],
    ),
  );
}

Widget _item(CelebrityMoviesState state, context, index) {
  return GestureDetector(
    onTap: () {
      NavigatorUtil.push(
        context,
        MovieDetailPage(
          movieId: state.celebrityData.works[index].subject.id,
        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///电影图片
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 400),
//              width: ScreenUtil().setWidth(180),
              height: ScreenUtil().setHeight(200),
              imageUrl: state.celebrityData.works[index].subject.images.medium,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),

        ///电影文字
        Container(
          width: ScreenUtil().setWidth(200),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
          alignment: Alignment.topLeft,
          child: Text(
            state.celebrityData.works[index].subject.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: ScreenUtil().setSp(26),
            ),
          ),
        ),

        Row(
          children: <Widget>[
            Container(
              child: FlutterRatingBarIndicator(
                itemPadding: EdgeInsets.all(0),
                rating: (state
                            .celebrityData.works[index].subject.rating.average /
                        state.celebrityData.works[index].subject.rating.max) *
                    5,
                itemCount: 5,
                itemSize: 10.0,
                emptyColor: Colors.black.withAlpha(50),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              child: Text(
                (state.celebrityData.works[index].subject.rating.average
                    .toString()),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(22),
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
