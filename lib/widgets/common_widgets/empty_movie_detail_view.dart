import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

///
/// @created by 文景睿
/// description:电影详情在没有数据时候的空占位布局
///
class EmptyMovieDetailView extends StatelessWidget {
  final Color _color = Colors.grey[200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _color,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Shimmer.fromColors(
        period: const Duration(milliseconds: 600),
        baseColor: Constants.APP_SKELETON_COLOR,
        highlightColor: Colors.white,
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _header(),
              _ban(),
              _columns(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(250),
            width: ScreenUtil().setWidth(200),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: _color),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                color: _color,
                height: ScreenUtil().setHeight(16),
                width: ScreenUtil().setWidth(340),
              ),
              SizedBox(height: 20),
              Container(
                color: _color,
                height: ScreenUtil().setHeight(16),
                width: ScreenUtil().setWidth(340),
              ),
              SizedBox(height: 20),
              Container(
                color: _color,
                height: ScreenUtil().setHeight(16),
                width: ScreenUtil().setWidth(200),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _ban() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: _color),
      height: ScreenUtil().setHeight(160),
    );
  }

  Widget _columns() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil().setWidth(530),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil().setWidth(180),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.9,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.9,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.9,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.7,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.8,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.7,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.7,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: _color,
            height: ScreenUtil().setHeight(16),
            width: ScreenUtil.screenWidthDp * 0.8,
          ),
        ],
      ),
    );
  }
}
