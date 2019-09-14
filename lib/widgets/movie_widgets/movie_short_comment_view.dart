import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中的短评布局
///
class MovieShortCommentView extends StatelessWidget {
  final MovieDetailEntity data;

  const MovieShortCommentView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(100, 0, 0, 0),
        ),
        child: Column(
          children: <Widget>[
            _header(),
            _shortCommentList(context),
          ],
        ),
      ),
    );
  }

  ///头布局
  Widget _header() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                '短评',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(35),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, bottom: 5),
            child: Text(
              '全部63534 >',
              style: TextStyle(
                  color: Colors.white54, fontSize: ScreenUtil().setSp(21)),
            ),
          ),
        ],
      ),
    );
  }

  ///短评列表布局
  Widget _shortCommentList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 20),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.popularComments.length,
          itemBuilder: (context, index) => _shortCommentItem(context, index)),
    );
  }

  ///短评的列表中的item
  Widget _shortCommentItem(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          _itemHeader(index),
          _content(index),
          _divider(index),
        ],
      ),
    );
  }

  ///item的头
  Widget _itemHeader(index) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: data.popularComments[index].author.avatar,
              height: ScreenUtil().setHeight(50),
              fadeInDuration: Duration(milliseconds: 200),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ///用户名字
                Text(
                  data.popularComments[index].author.name,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),

                ///星级和日期
                Row(
                  children: <Widget>[
                    ///星级
                    FlutterRatingBarIndicator(
                      itemSize: 7,
                      itemPadding: EdgeInsets.all(1),
                      rating: data.popularComments[index].rating.value,
                    ),

                    ///日期
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        data.popularComments[index].createdAt.substring(5, 10),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white54),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///item的内容部分
  Widget _content(index) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///评论内容
          Text(
            "    " + data.popularComments[index].content,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(24),
            ),
          ),

          ///点赞的图片和数量
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ///点赞图片
                Image.asset(
                  Constants.ASSETS_IMG + 'ic_vote_normal_large.png',
                  height: ScreenUtil().setHeight(30),
                ),

                ///点赞数
                Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setHeight(10),
                      bottom: ScreenUtil().setHeight(2)),
                  child: Text(
                    '${data.popularComments[index].usefulCount.toString()} 人',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: ScreenUtil().setSp(21)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(index) {
    ///如果是最后一个item那么就不画分割线
    if (index == data.popularComments.length - 1) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
        height: 1,
        width: ScreenUtil().setWidth(650),
        color: Colors.white12,
      );
    }
  }
}
