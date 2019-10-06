import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

///
/// @created by 文景睿
/// description:生成二维码页面
///
class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: 'jfnmkdjenmfkcjxnmkfnjd',
          size: ScreenUtil().setHeight(400),
        ),
      ),
    );
  }
}
