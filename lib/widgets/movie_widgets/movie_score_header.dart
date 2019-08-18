import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中豆瓣评分的card的头布局
///
class MovieScoreHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: ScreenUtil().setHeight(40),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                '豆瓣评分TM',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20), color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, right: 10),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}
