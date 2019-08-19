import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicView extends StatefulWidget {
  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text('音乐'),
    );
  }
}
