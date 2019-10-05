import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/widgets/common_widgets/rating_bar_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rating_bar/rating_bar.dart';

///
/// @created by 文景睿
/// description:电影详情页面的appbar上面的左上角电影指示器，会根据外部的滚动显示透明度的
///
class MovieDetailAppbarIndicator extends StatefulWidget {
  final MovieDetailEntity data;

  const MovieDetailAppbarIndicator({Key key, this.data}) : super(key: key);

  @override
  MovieDetailAppbarIndicatorState createState() =>
      MovieDetailAppbarIndicatorState();
}

class MovieDetailAppbarIndicatorState
    extends State<MovieDetailAppbarIndicator> {
  double opacity = 0.0;
  double currentOffsetY = 0;

  @override
  Widget build(BuildContext context) {
    ///这里是平移动画+透明度渐变动画
    return RepaintBoundary(
      child: Transform.translate(
        offset: Offset(0, currentOffsetY),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 0),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Row(
      children: <Widget>[
        ///图片
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(4)),
          child: CachedNetworkImage(
            imageUrl: this.widget.data.images.small,
            height: ScreenUtil().setHeight(40),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _movieName(),
              _starScore(),
            ],
          ),
        ),
      ],
    );
  }

  ///电影名字
  Widget _movieName() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Text(this.widget.data.title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(25))),
    );
  }

  ///评分条，星星和分数
  Widget _starScore() {
    double rating =
        (this.widget.data.rating.average / this.widget.data.rating.max) * 5;

    if (rating == 0.0) {
      return Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
        child: Text('尚未上映',
            style: TextStyle(
                color: Colors.white70, fontSize: ScreenUtil().setSp(20))),
      );
    }

    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      child: Row(
        children: <Widget>[
          ///星星
          RatingBarIndicator(
            size: ScreenUtil().setHeight(12),
            rating: rating,
            filledColor: Colors.orange[300],
          ),

          ///评分
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
            child: Text(
              this.widget.data.rating.average.toString(),
              style: TextStyle(
                  color: Colors.white60, fontSize: ScreenUtil().setSp(22)),
            ),
          ),
        ],
      ),
    );
  }

  void updateOpacity(opacity, offsetY) {
    this.opacity = opacity;
    this.currentOffsetY = offsetY;
    setState(() {});
  }
}
