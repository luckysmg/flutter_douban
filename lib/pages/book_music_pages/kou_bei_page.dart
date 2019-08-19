import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:一周口碑榜
///
class KouBeiPage extends StatefulWidget {
  @override
  _KouBeiPageState createState() => _KouBeiPageState();
}

class _KouBeiPageState extends State<KouBeiPage> {
  @override
  void initState() {
    super.initState();
    if(context == null){
      print('null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('kouian'),
        ),
      ),
    );
  }
}
