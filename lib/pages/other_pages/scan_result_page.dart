import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:扫码结束后的扫码数据反馈页面
///
class ScanResultPage extends StatelessWidget {
  final data;
  const ScanResultPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(400),
                  bottom: ScreenUtil().setHeight(50)),
              child: Text('二维码获取的数据如下',
                  style: TextStyle(fontSize: ScreenUtil().setSp(40))),
            ),
            Text(data,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
