import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;

class DouBanRefreshHeader extends RefreshIndicator {
  @override
  State<StatefulWidget> createState() {
    return DouBanRefreshHeaderState();
  }
}

class DouBanRefreshHeaderState
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

      textContent = "下拉刷新";
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
        height: 40,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            indicator,
            SizedBox(
              width: 24,
            ),
            Container(
              width: 70,
              child: Text(textContent,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
      _scaleAnimation.value = offset / 80.0;
    }
    super.onOffsetChange(offset);
  }

  @override
  Future<void> endRefresh() {
    return super.endRefresh();
  }

  @override
  void resetValue() {
    _scaleAnimation.value = 0.0;
    _rotateAnimation.value = 0.0;
  }
}
