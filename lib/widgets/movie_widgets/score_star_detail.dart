import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情，豆瓣评分中数据的评分和星星的布局
///
class ScoreStarDetail extends StatelessWidget {
  final MovieDetailRating rating;

  const ScoreStarDetail({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: ScreenUtil().setHeight(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _scoreWithStar(),
          _percentProgress(),
        ],
      ),
    );
  }

  ///靠左边的大分数和星星
  Widget _scoreWithStar() {
    return Container(
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            rating.average.toString(),
            style: TextStyle(
                fontSize: ScreenUtil().setSp(52),
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          FlutterRatingBarIndicator(
            itemPadding: EdgeInsets.all(1),
            itemSize: 10,
            fillColor: Colors.amber,
            rating: rating.average / 10 * 5,
            emptyColor: Colors.grey[400],
          )
        ],
      ),
    );
  }

  ///靠右边的显示的各个星级的分布情况
  Widget _percentProgress() {
    var totalCount = rating.details.one +
        rating.details.two +
        rating.details.three +
        rating.details.four +
        rating.details.five;
    var fiveStarPercent = rating.details.five / totalCount;
    var fourStarPercent = rating.details.four / totalCount;
    var threeStarPercent = rating.details.three / totalCount;
    var twoStarPercent = rating.details.two / totalCount;
    var onePercent = rating.details.one / totalCount;

    print(rating.details.five);
    print(totalCount);
    print(rating.details.five / totalCount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _starWithIndicator(5, fiveStarPercent),
        _starWithIndicator(4, fourStarPercent),
        _starWithIndicator(3, threeStarPercent),
        _starWithIndicator(2, twoStarPercent),
        _starWithIndicator(1, onePercent),
        _scorerNum(),
      ],
    );
  }

  ///星级旁边的分布进度条
  Widget _progressIndicator(double progress) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            height: ScreenUtil().setHeight(10),
            width: ScreenUtil().setWidth(300),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            height: ScreenUtil().setHeight(10),
            width: ScreenUtil().setWidth(300 * progress),
          ),
        ],
      ),
    );
  }

  ///星星
  Widget _starIndicator(double num) {
    return FlutterRatingBarIndicator(
      itemPadding: EdgeInsets.all(1),
      itemSize: 8,
      itemCount: num.toInt(),
      rating: num,
      fillColor: Colors.grey[200],
    );
  }

  ///星星和分布进度条的组合布局
  Widget _starWithIndicator(double num, double progress) {
    return Expanded(
      child: Container(
        child: Row(
          children: <Widget>[_starIndicator(num), _progressIndicator(progress)],
        ),
      ),
    );
  }

  ///评分人数
  Widget _scorerNum() {
    return Text(
      '8217621人评分',
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white24,
          fontSize: ScreenUtil().setSp(22)),
    );
  }
}
