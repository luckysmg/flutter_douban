import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// @created by 文景睿
/// description:我的
///
class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  var isUsingRealNetwork = false;
  var headerOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    isUsingRealNetwork = Constants.isRealNetworkData;
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      headerOpacity = 1.0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          _appBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: true,
      elevation: 0.0,
      expandedHeight: ScreenUtil().setHeight(200),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: AnimatedOpacity(
          opacity: headerOpacity,
          duration: Duration(milliseconds: 800),
          child: Image.asset(
            Constants.ASSETS_IMG + 'personal_header.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Text('我的'),
    );
  }
}
