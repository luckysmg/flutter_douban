import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomFooterIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: _buildFooter,
    );
  }

  Widget _buildFooter(context, status) {
    var img;
    var textContent;
    if (status == LoadStatus.idle || status == LoadStatus.canLoading) {
      return Container();
    }
    if (status == LoadStatus.loading) {
      img = CupertinoActivityIndicator();
      textContent = "加载中";
    } else if (status == LoadStatus.noMore) {
      img = Container();
      textContent = "没有更多数据了";
    }
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          img,
          SizedBox(width: 20),
          Text(textContent),
        ],
      ),
    );
  }
}
