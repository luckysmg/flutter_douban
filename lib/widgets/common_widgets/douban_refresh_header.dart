import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;

///
/// @created by 文景睿
/// description:书阴影首页的刷新交互头布局，在不同的刷新状态提供不同
/// 的交互效果
///
class DouBanRefreshHeader extends RefreshIndicator {
  @override
  State<StatefulWidget> createState() {
    return _DouBanRefreshHeaderState();
  }
}

class _DouBanRefreshHeaderState
    extends RefreshIndicatorState<DouBanRefreshHeader>
    with TickerProviderStateMixin {
  AnimationController _scaleAnimation;
  AnimationController _rotateAnimation;
  var indicator;
  var textContent;

  @override
  void initState() {
    _scaleAnimation = AnimationController(vsync: this);
    _rotateAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _rotateAnimation.reset();
          _rotateAnimation.forward();
        }
      });
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    if (mode == RefreshStatus.idle ||
        mode == RefreshStatus.canRefresh ||
        mode == RefreshStatus.completed) {
      indicator = ScaleTransition(
        scale: _scaleAnimation,
        child: Image.asset(
          "assets/images/indicator.png",
          fit: BoxFit.contain,
        ),
      );

      if (mode == RefreshStatus.canRefresh) {
        textContent = "松开刷新";
      } else if (mode == RefreshStatus.idle) {
        textContent = "下拉刷新";
      }
    } else if (mode == RefreshStatus.refreshing) {
      indicator = RotationTransition(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/indicator.png",
          fit: BoxFit.contain,
        ),
        turns: _rotateAnimation,
      );
      textContent = "加载中";
    }

    if (mode == RefreshStatus.completed) {
      textContent = '加载完成';
    }

    return Container(
        height: ScreenUtil().setHeight(55),
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            indicator,
            SizedBox(
              width: 24,
            ),
            Container(
              width: ScreenUtil().setWidth(110),
              child: Text(textContent,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      fontWeight: FontWeight.w500)),
            )
          ],
        ));
  }

  @override
  void onModeChange(RefreshStatus mode) {
    if (mode == RefreshStatus.refreshing) {
      _rotateAnimation.forward();
    }
    super.onModeChange(mode);
  }

  @override
  void onOffsetChange(double offset) {
    if (!floating) {
      _scaleAnimation.value = offset / 60.0;
    }
    super.onOffsetChange(offset);
  }

  @override
  void resetValue() {
    _scaleAnimation.value = 0.0;
    _rotateAnimation.value = 0.0;
  }

  @override
  void dispose() {
    _scaleAnimation.dispose();
    _rotateAnimation.dispose();
    super.dispose();
  }
}
