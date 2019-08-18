import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:自定义的底部抽屉控件(这个为自定义控件的特效,属于高级UI的部分
///  涉及到手势交互，动画拆分等，逻辑较难，建议在学完基础之后在看此类）
///
/// 推荐参数：
/// maxOffsetDistance: ScreenUtil.screenHeightDp * 0.16,
/// originalOffset: ScreenUtil.screenHeightDp * 0.98,
/// content的height：ScreenUtil.screenHeightDp,
/// header高度  ScreenUtil().setHeight(90)
///
class BottomDraggableDrawer extends StatefulWidget {
  ///原始的偏移
  final double originalOffset;

  ///可拖拽的头(只有此控件能同时响应手势拖拽和点击来关闭抽屉)
  final Widget draggableHeader;

  ///内容布局
  final Widget content;

  ///最大偏移量
  final double maxOffsetDistance;

  ///动画时间（单位是毫秒，默认值=250）
  final int animationDuration;

  final double d = ScreenUtil.screenHeightDp;

  BottomDraggableDrawer(
      {@required this.draggableHeader,
      @required this.content,
      @required this.originalOffset,
      @required this.maxOffsetDistance,
      this.animationDuration = 200});

  @override
  _BottomDraggableDrawerState createState() => _BottomDraggableDrawerState();
}

class _BottomDraggableDrawerState extends State<BottomDraggableDrawer>
    with TickerProviderStateMixin {
  ///原始偏移值
  double originalOffset;

  ///当前的偏移值
  double offsetDistance;

  ///这个是最大的偏移量
  double maxOffsetDistance;

  ///时间
  int animationDuration;

  double startPos;
  double endPos;

  ///是否已经到达底部的标示
  bool hasToBottom = true;
  bool toTop;

  ///方向标示

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

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
    hasToBottom = true;
    originalOffset = this.widget.originalOffset;
    maxOffsetDistance = this.widget.maxOffsetDistance;
    offsetDistance = originalOffset;
    animationDuration = this.widget.animationDuration;
    offsetDistance = offsetDistance.clamp(maxOffsetDistance, originalOffset);
    animationDuration = this.widget.animationDuration;
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
                _open(false);
              } else {
                _close(false);
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
      _open(true);
      return;
    } else if (details.velocity.pixelsPerSecond.dy > 0) {
      _close(true);
      return;
    }

    if (toTop) {
      _open(true);
    } else {
      _close(true);
    }
  }

  ///打开抽屉
  void _open(bool isDragging) {
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
  }

  ///关闭抽屉
  void _close(bool isDragging) {
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
  }
}
