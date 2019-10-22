import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中的appbar的title
///
class MovieDetailAppbarTitle extends StatelessWidget {
  final double opacity;

  const MovieDetailAppbarTitle({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 0),
      opacity: opacity,
      child: Text(
        '电影',
        style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.white),
      ),
    );
  }
}
