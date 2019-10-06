import 'dart:math';
import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:图片详情放大页面
///

class ImagePreviewPage extends StatefulWidget {
  final String url;
  final BoxFit fit;

  ImagePreviewPage(this.url, this.fit);

  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  Color color;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImageSlidePage(
      slideEndHandler: (offset) {
        return _slideEndHandler(offset: offset);
      },
      slideScaleHandler: (offset) {
        return _slideScaleHandler(offset: offset);
      },
      slidePageBackgroundHandler: (offset, size) {
        ///这里根据他的offset的状态回调设置背景的透明度
        return _slidePageBackgroundHandler(offset: offset, pageSize: size);
      },
      child: loaded ? _loadedContent() : _initContent(),
    );
  }

  Widget _initContent() {
    return Hero(
      tag: widget.url,
      child: ExtendedImage.network(
        widget.url,
        enableSlideOutPage: true,
        mode: ExtendedImageMode.gesture,
        enableLoadState: false,
      ),
    );
  }

  Widget _loadedContent() {
    return ExtendedImage.network(
      widget.url,
      enableSlideOutPage: true,
      mode: ExtendedImageMode.gesture,
      enableLoadState: false,
      heroBuilderForSlidingPage: (result) {
        return Hero(
          tag: this.widget.url,
          child: result,
          flightShuttleBuilder: (BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext) {
            final Hero hero = flightDirection == HeroFlightDirection.pop
                ? fromHeroContext.widget
                : toHeroContext.widget;
            return hero.child;
          },
        );
      },
    );
  }
}

Color _slidePageBackgroundHandler(
    {Offset offset, Size pageSize, Color color, SlideAxis pageGestureAxis}) {
  if (offset.dy >= 0) {
    if (offset.dy <= 255) {
      return Color.fromARGB(255 - ((offset.dy) * 0.6).toInt(), 0, 0, 0);
    } else {
      return Color.fromARGB(25, 0, 0, 0);
    }
  } else {
    if (offset.dy >= -255) {
      return Color.fromARGB(255 + (offset.dy * 0.6).toInt(), 0, 0, 0);
    } else {
      return Color.fromARGB(25, 0, 0, 0);
    }
  }
}

bool _slideEndHandler(
    {Offset offset, Size pageSize, SlideAxis pageGestureAxis}) {
  if (pageGestureAxis == SlideAxis.both) {
    return offset.distance >
        Offset(pageSize.width, pageSize.height).distance / 3.5;
  } else if (pageGestureAxis == SlideAxis.horizontal) {
    return offset.dx.abs() > pageSize.width / 3.5;
  } else if (pageGestureAxis == SlideAxis.vertical) {
    return offset.dy.abs() > pageSize.height / 3.5;
  }
  return true;
}

double _slideScaleHandler(
    {Offset offset, Size pageSize, SlideAxis pageGestureAxis}) {
  double scale = 0.0;
  if (pageGestureAxis == SlideAxis.both) {
    scale = offset.distance / Offset(pageSize.width, pageSize.height).distance;
  } else if (pageGestureAxis == SlideAxis.horizontal) {
    scale = offset.dx.abs() / (pageSize.width / 2.0);
  } else if (pageGestureAxis == SlideAxis.vertical) {
    scale = offset.dy.abs() / (pageSize.height / 2.0);
  }
  return max(1.0 - scale, 0.8);
}
