import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_douban/widgets/common_widgets/bottom_draggable_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'long_comment_list_view.dart';

///
/// @created by 文景睿
/// description:电影底部的上拉抽屉
///
// ignore: must_be_immutable
class MovieDetailDrawer extends StatelessWidget {
  final MovieLongCommentEntity longCommentData;

  MovieDetailDrawer({Key key, this.longCommentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: BottomDraggableDrawer(
        maxOffsetDistance: ScreenUtil.screenHeightDp * 0.16,
        originalOffset: ScreenUtil.screenHeightDp * 0.98,
        draggableHeader: _header(),
        content: LongCommentListView(longCommentData: longCommentData),
      ),
    );
  }

  ///抽屉头布局
  Widget _header() {
    return Container(
      height: ScreenUtil().setHeight(90),
      width: ScreenUtil.screenWidthDp,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          _dragIndicator(),
          _title(),
        ],
      ),
    );
  }

  ///抽屉头部中间的那个小的灰色指示器
  Widget _dragIndicator() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          height: ScreenUtil().setHeight(10),
          width: ScreenUtil().setWidth(100),
        ),
      ),
    );
  }

  ///标题
  Widget _title() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(24), left: ScreenUtil().setWidth(20)),
      child: Text(
        '影评（${longCommentData.total}）',
        style: TextStyle(fontSize: ScreenUtil().setSp(25)),
      ),
    );
  }
}