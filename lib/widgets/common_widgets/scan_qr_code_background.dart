import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:由于没有现成的，框架也没提供，这里通过手写并自绘二维码扫码界面背景UI
///
class ScanQRCodeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      willChange: true,
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      painter: _CustomPainter(),
    );
  }
}

class _CustomPainter extends CustomPainter {
  ///边框距离顶部的高度
  var topDistance;

  @override
  void paint(Canvas canvas, Size size) {
    topDistance = ScreenUtil().setHeight(360);
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color.fromARGB(140, 200, 200, 200);

    canvas.drawRect(
        Offset.zero & Size(ScreenUtil.screenWidthDp, topDistance), paint);

    canvas.drawRect(
        Offset(0, topDistance) &
            Size(
                ScreenUtil.screenWidthDp * 0.2, ScreenUtil.screenWidthDp * 0.6),
        paint);

    canvas.drawRect(
        Offset(ScreenUtil.screenWidthDp * 0.8, topDistance) &
            Size(
                ScreenUtil.screenWidthDp * 0.2, ScreenUtil.screenWidthDp * 0.6),
        paint);

    canvas.drawRect(
        Offset(0, topDistance + ScreenUtil.screenWidthDp * 0.6) &
            Size(
                ScreenUtil.screenWidthDp,
                (ScreenUtil.screenHeightDp -
                    topDistance -
                    ScreenUtil.screenWidthDp * 0.6)),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
