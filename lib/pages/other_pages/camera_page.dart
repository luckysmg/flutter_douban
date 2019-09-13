import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/book_music_pages/image_page.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController controller;
  List cameras;

  String timestamp() =>
      DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

  @override
  void initState() {
    super.initState();
    availableCameras().then((data) {
      cameras = data;
    }).whenComplete(() {
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && controller.value.isInitialized) {
      return _cameraPreview();
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(),
      );
    }
  }

  ///预览界面
  Widget _cameraPreview() {
    ///获取相机的尺寸比例
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          _surfaceView(),
          _controlBar(),
        ],
      ),
    );
  }

  ///显示预览的画面
  Widget _surfaceView() {
    return Container(
      height: ScreenUtil.screenHeight,
      child: FittedBox(

        ///进行fitHeight形式的缩放，是全屏的相机
        fit: BoxFit.fitHeight,
        child: Container(
            width: ScreenUtil.screenHeight * controller.value.aspectRatio,
            height: ScreenUtil.screenHeight,
            child: CameraPreview(controller)),
      ),
    );
  }

  ///控制栏
  Widget _controlBar() {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(100)),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          _backIcon(),
          _takePhotoButton(),
        ],
      ),
    );
  }

  ///拍照按钮
  Widget _takePhotoButton() {
    return GestureDetector(
      onTap: () async {
        takePicture().then((path) {
          if (path != null) {
            NavigatorUtil.push(
              context,
              ImagePage(
                image: File(path),
              ),
            );
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(120)),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(
              Icons.fiber_manual_record,
              color: Colors.white,
              size: ScreenUtil().setHeight(150),
            ),
            Icon(
              Icons.fiber_manual_record,
              color: Colors.white70,
              size: ScreenUtil().setHeight(200),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backIcon() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
        child: Icon(
          Icons.keyboard_arrow_down,
          size: ScreenUtil().setHeight(100),
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      ToastUtil.show(e.description);
      return null;
    }
    return filePath;
  }
}
