import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中的简介

class BriefIntroductionView extends StatefulWidget {
  final String text;

  BriefIntroductionView({Key key, this.text}) : super(key: key);

  @override
  _BriefIntroductionViewState createState() => _BriefIntroductionViewState();
}

class _BriefIntroductionViewState extends State<BriefIntroductionView> {
  bool isExpanded = false;
  var height;

  @override
  Widget build(BuildContext context) {
    ///内容布局
    var content;
    if (!isExpanded) {
      height = ScreenUtil().setHeight(240);
      content = Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
        constraints: BoxConstraints(
          minHeight: 50,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(120, 0, 0, 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                '简介',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                this.widget.text,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            GestureDetector(
              onTap: () {
                isExpanded = true;
                setState(() {
                  height = 400;
                });
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 10),
                  child: Text(
                    '展开',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: ScreenUtil().setSp(24)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      height = ScreenUtil().setHeight(600);
      content = Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
        constraints: BoxConstraints(
          minHeight: 50,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(120, 0, 0, 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                '简介',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(
                this.widget.text,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(24)),
              ),
            ),
          ],
        ),
      );
    }

    return SliverToBoxAdapter(
      child: content,
    );
  }
}
