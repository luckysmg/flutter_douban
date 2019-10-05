import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/pages/other_pages/scan_result_page.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrcode/qrcode.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  QRCaptureController _captureController;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 350), () {
      _captureController = QRCaptureController();
      _captureController.onCapture((data) {
        _captureController.pause();
        NavigatorUtil.push(context, ScanResultPage(data),
            finishCurrentPage: true);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_captureController == null) {
      return Scaffold(
        body: Container(),
        backgroundColor: Colors.black,
      );
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRCaptureView(controller: _captureController),
          Positioned(
            bottom: ScreenUtil().setHeight(100),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: ScreenUtil().setHeight(100),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _captureController.pause();
    _captureController = null;
  }
}
