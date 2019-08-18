import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中豆瓣评分的card的脚布局
///
class MovieScoreFooter extends StatelessWidget {
  ///想看数
  final int wishCount;

  ///看过数
  final int lookedCount;

  const MovieScoreFooter({Key key, this.lookedCount, this.wishCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 5, right: 15),
        alignment: Alignment.bottomRight,
        child: Text(
          '$lookedCount人看过   $wishCount人想看',
          style: TextStyle(
              color: Colors.white54, fontSize: ScreenUtil().setSp(22)),
        ),
      ),
    );
  }
}
