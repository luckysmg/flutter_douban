import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/pages/other_pages/scan_result_page.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/widgets/common_widgets/scan_qr_code_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          ScanQRCodeBackground(),
          _buildFlashLightButton(),
          _buildAppBar(),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((data) {
      controller.dispose();
      NavigatorUtil.push(
          context,
          ScanResultPage(
            data: data,
          ),
          finishCurrentPage: true);
    });
  }

  ///Appbar
  Widget _buildAppBar() {
    return CupertinoNavigationBar(
      backgroundColor: Colors.transparent,
      middle: Text('二维码扫描', style: TextStyle(color: Colors.white)),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white70,
        ),
      ),
    );
  }

  ///手电筒图标按钮
  Widget _buildFlashLightButton() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(1000)),
      child: GestureDetector(
        onTap: () {
          controller.toggleFlash();
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: Icon(
                Icons.lightbulb_outline,
                color: Colors.white70,
                size: ScreenUtil().setHeight(50),
              ),
            ),
            Text('轻触照亮',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(30)))
          ],
        ),
      ),
    );
  }
}
