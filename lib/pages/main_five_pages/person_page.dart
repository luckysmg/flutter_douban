import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/other_pages/qr_code_page.dart';
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
              [
                _useNetworkTile(),
                _qrCodeEntry(),
              ],
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

  ///是否使用真实网络数据的ListTile
  Widget _useNetworkTile() {
    return ListTile(
      leading: Icon(Icons.wifi),
      title: Text('书影音是否使用真实网络收据'),
      trailing: CupertinoSwitch(
        value: isUsingRealNetwork,
        onChanged: (value) {
          SharedPreferences.getInstance().then((data) {
            data.setBool(Constants.USE_REAL_NETWORK, value);
          });
          setState(() {
            isUsingRealNetwork = value;
          });

          showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: CupertinoAlertDialog(
                  title: Text('注意'),
                  content: Center(
                    child: Text('请关闭app后重启生效!',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            letterSpacing: 2)),
                  ),
                  actions: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(20)),
                            child: Text('确定',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(35),
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _qrCodeEntry() {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(context, QrCodePage(), rootNavigator: true);
      },
      child: ListTile(
        leading: Icon(Icons.pages),
        title: Text('进入二维码生成界面'),
      ),
    );
  }
}
