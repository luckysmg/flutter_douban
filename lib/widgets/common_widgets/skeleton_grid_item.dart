import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

///
/// @created by 文景睿
/// description:主页影院热映的grid在加载时候用的loading骨架布局
///
class SkeletonGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: ScreenUtil().setWidth(220),
            height: ScreenUtil().setHeight(260),
            color: Constants.APP_SKELETON_COLOR,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Constants.APP_SKELETON_COLOR,
          ),
          height: ScreenUtil().setHeight(12),
          width: ScreenUtil().setWidth(170),
          margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(8),
              bottom: ScreenUtil().setHeight(10)),
        ),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Constants.APP_SKELETON_COLOR,
              ),
              height: ScreenUtil().setHeight(8),
              width: ScreenUtil().setWidth(90),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(30),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Constants.APP_SKELETON_COLOR,
              ),
              height: ScreenUtil().setHeight(8),
              width: ScreenUtil().setWidth(50),
            )
          ],
        ),
      ],
    );
  }
}
