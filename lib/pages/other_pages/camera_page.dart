import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController controller;
  List cameras;

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              child: CameraPreview(controller),
              aspectRatio: controller.value.aspectRatio,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(120),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: ScreenUtil().setHeight(100),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(140),
              ),
              _takePhotoButton(),
            ],
          ),
        ],
      ),
    );
  }

  ///拍照按钮
  Widget _takePhotoButton() {
    return GestureDetector(
      onTap: () {
        ToastUtil.show('拍照！');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: ScreenUtil().setHeight(160),
          width: ScreenUtil().setWidth(200),
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
}
