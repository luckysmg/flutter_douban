import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
/// @created LuckySmg
///
/// 示例参数（各位可以根据示例参数慢慢调整，以下是给出的示例）：
/// 关于ScreenUtil：https://pub.dev/packages/flutter_screenutil
/// 注意（这些高度都是离对顶部的高度，在外部positioned的bottom为0的情况下）
/// maxOffsetDistance: ScreenUtil.screenHeightDp * 0.18,
/// originalOffset: ScreenUtil.screenHeightDp * 0.98,
/// content的height：ScreenUtil.screenHeightDp,
///
class BottomDraggableDrawer extends StatefulWidget {
  ///原始的偏移
  final double originalOffset;

  ///可拖拽的头(只有此控件能同时响应手势拖拽和点击来关闭抽屉！！)
  final Widget draggableHeader;

  ///内容布局
  final Widget content;

  ///最大偏移量
  final double maxOffsetDistance;

  ///动画时间（单位是ms，默认值 = 250ms）
  final int animationDuration;

  ///打开或关闭的状态回调
  final ValueChanged onOpened;

  final BottomDraggableDrawerController controller;

  BottomDraggableDrawer(
      {@required this.draggableHeader,
      @required this.content,
      @required this.originalOffset,
      @required this.maxOffsetDistance,
      this.animationDuration = 250,
      this.onOpened,
      this.controller});

  @override
  BottomDraggableDrawerState createState() => BottomDraggableDrawerState();
}

class BottomDraggableDrawerState extends State<BottomDraggableDrawer>
    with TickerProviderStateMixin {
  BottomDraggableDrawerController controller;

  ValueChanged<bool> onOpened;

  ///原始偏移值
  double originalOffset;

  ///当前的偏移值
  double offsetDistance;

  ///这个是最大的偏移量
  double maxOffsetDistance;

  ///动画时间
  int animationDuration;

  double startPos;
  double endPos;

  ///是否已经到达底部的标示
  bool hasToBottom = true;

  ///到顶部
  bool toTop = false;

  ///方向标示

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.state = this;
    onOpened = widget.onOpened;
    originalOffset = this.widget.originalOffset;
    maxOffsetDistance = this.widget.maxOffsetDistance;
    offsetDistance = originalOffset;
    animationDuration = this.widget.animationDuration;
    offsetDistance = offsetDistance.clamp(maxOffsetDistance, originalOffset);
    animationDuration = this.widget.animationDuration;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: animationDuration));
  }

  @override
  void didUpdateWidget(BottomDraggableDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller = widget.controller;
    onOpened = widget.onOpened;
    hasToBottom = true;
    originalOffset = widget.originalOffset;
    maxOffsetDistance = widget.maxOffsetDistance;
    offsetDistance = originalOffset;
    animationDuration = widget.animationDuration;
    offsetDistance = offsetDistance.clamp(maxOffsetDistance, originalOffset);
    animationDuration = widget.animationDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offsetDistance),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (hasToBottom) {
                open(false);
              } else {
                close(false);
              }
            },
            onVerticalDragStart: _start,
            onVerticalDragUpdate: _update,
            onVerticalDragEnd: _end,
            child: this.widget.draggableHeader,
          ),
          this.widget.content,
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _start(DragStartDetails details) {}

  void _update(DragUpdateDetails details) {
    offsetDistance += details.delta.dy;
    if (details.delta.dy > 0) {
      toTop = false;
    } else {
      toTop = true;
    }
    setState(() {});
  }

  void _end(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy < 0) {
      open(true);
      return;
    } else if (details.velocity.pixelsPerSecond.dy > 0) {
      close(true);
      return;
    }

    if (toTop) {
      open(true);
    } else {
      close(true);
    }
  }

  ///打开抽屉
  void open(bool isDragging) {
    hasToBottom = false;
    if (!isDragging) {
      startPos = originalOffset;
    } else {
      startPos = offsetDistance;
    }
    endPos = maxOffsetDistance;
    animationController.value = 0.0;
    final CurvedAnimation curve = CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut);
    animation = Tween(begin: startPos, end: endPos).animate(curve)
      ..addListener(() {
        offsetDistance = animation.value;
        setState(() {});
      });
    animationController.forward();
    if (onOpened != null) {
      onOpened(true);
    }
  }

  ///关闭抽屉
  void close(bool isDragging) {
    hasToBottom = true;

    if (!isDragging) {
      startPos = maxOffsetDistance;
    } else {
      startPos = offsetDistance;
    }

    endPos = originalOffset;
    animationController.value = 0.0;
    final CurvedAnimation curve = CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut);
    animation = Tween(begin: startPos, end: endPos).animate(curve)
      ..addListener(() {
        offsetDistance = animation.value;
        setState(() {});
      });
    animationController.forward();
    if (onOpened != null) {
      onOpened(false);
    }
  }
}

///控制器
class BottomDraggableDrawerController {
  BottomDraggableDrawerState state;

  void switchDrawerStatus() {
    if (state.hasToBottom) {
      state.open(false);
    } else {
      state.close(false);
    }
  }
}
