import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中的appbar的title
///

class MovieDetailAppbarTitle extends StatefulWidget {
  MovieDetailAppbarTitle({Key key}) : super(key: key);

  @override
  MovieDetailAppbarTitleState createState() {
    return MovieDetailAppbarTitleState();
  }
}

class MovieDetailAppbarTitleState extends State<MovieDetailAppbarTitle> {
  double opacity = 1.0;

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

  void update(double opacity) {
    this.opacity = opacity;
    setState(() {});
  }
}
