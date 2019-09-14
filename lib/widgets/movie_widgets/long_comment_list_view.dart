import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

///
/// @created by 文景睿
/// description:抽屉中影评的列表
///
class LongCommentListView extends StatelessWidget {
  final MovieLongCommentEntity longCommentData;

  const LongCommentListView({Key key, this.longCommentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil.screenWidthDp,
      height: ScreenUtil.screenHeightDp,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: longCommentData.count,
        itemBuilder: (context, index) => _item(context, index),
      ),
    );
  }

  ///列表项
  Widget _item(BuildContext context, index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _itemHeader(index),
            _itemBody(index),
          ],
        ),
      ),
    );
  }

  Widget _itemHeader(index) {
    return Container(
      margin: EdgeInsets.only(left: 12, top: ScreenUtil().setHeight(15)),
      child: Row(
        children: <Widget>[
          ///头像
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: longCommentData.reviews[index].author.avatar,
                height: ScreenUtil().setHeight(40),
                fadeInDuration: Duration(milliseconds: 0),
              ),
            ),
          ),

          ///名字
          Container(
            margin: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(10),
                left: ScreenUtil().setWidth(10)),
            child: Text(
              longCommentData.reviews[index].author.name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(25)),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(10),
                left: ScreenUtil().setWidth(10)),
            child: FlutterRatingBarIndicator(
              rating: longCommentData.reviews[index].rating.value.toDouble(),
              itemSize: 8,
              itemPadding: EdgeInsets.all(ScreenUtil().setWidth(1)),
              emptyColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  ///item的主体
  Widget _itemBody(index) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(index),
          _itemContent(index),
          _itemFooter(index),
          _divider(index),
        ],
      ),
    );
  }

  ///内容的标题
  Widget _title(index) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: Text(
        longCommentData.reviews[index].title,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(32), fontWeight: FontWeight.bold),
      ),
    );
  }

  ///item的内容
  Widget _itemContent(index) {
    return Container(
      margin: EdgeInsets.only(left: 12, top: ScreenUtil().setHeight(20)),
      child: Text(
        longCommentData.reviews[index].summary,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _itemFooter(index) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(15),
          bottom: ScreenUtil().setHeight(20),
          left: 12),
      child: Row(
        children: <Widget>[
          Text(
            '${longCommentData.reviews[index].commentsCount} 回复 · ${longCommentData.reviews[index].usefulCount} 有用',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: ScreenUtil().setSp(24)),
          ),
        ],
      ),
    );
  }

  Widget _divider(index) {
    if (index == longCommentData.reviews.length - 1) {
      return SizedBox(
        height: ScreenUtil().setHeight(240),
      );
    } else {
      return Container(
        height: ScreenUtil().setHeight(20),
        color: Colors.grey[300],
      );
    }
  }
}
