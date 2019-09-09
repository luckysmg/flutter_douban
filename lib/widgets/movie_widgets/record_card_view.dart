import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中已看过，记录此时感受的布局
///
class RecordCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(100, 0, 0, 0)),
        height: ScreenUtil().setHeight(70),
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            _stars(),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white54,
                )),
          ],
        ),
      ),
    );
  }

  Widget _stars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '已看过？记录此刻感受',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: ScreenUtil().setSp(26)),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(20),
        ),
        Image.asset(
          Constants.ASSETS_IMG + 'ic_info_done.png',
          height: ScreenUtil().setHeight(20),
          color: Colors.white70,
        ),
        Image.asset(
          Constants.ASSETS_IMG + 'ic_info_done.png',
          height: ScreenUtil().setHeight(20),
          color: Colors.white70,
        ),
        Image.asset(
          Constants.ASSETS_IMG + 'ic_info_done.png',
          height: ScreenUtil().setHeight(20),
          color: Colors.white70,
        ),
        Image.asset(
          Constants.ASSETS_IMG + 'ic_info_done.png',
          height: ScreenUtil().setHeight(20),
          color: Colors.white70,
        ),
        Image.asset(
          Constants.ASSETS_IMG + 'ic_info_done.png',
          height: ScreenUtil().setHeight(20),
          color: Colors.white70,
        ),
      ],
    );
  }
}
