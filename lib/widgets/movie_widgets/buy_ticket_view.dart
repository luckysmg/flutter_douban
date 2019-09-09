import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中选座购票的行布局
///
class BuyTicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.dashboard,
                      color: Colors.black87,
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20)),
                    Text(
                      '选座购票',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
