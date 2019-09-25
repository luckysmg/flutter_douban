import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/util/status_bar_util.dart';
import 'package:flutter_douban/widgets/common_widgets/custom_video_control_widget.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:视频播放页面(这里由于videoController的缘故，不适合用状态管理，所以就用key进行状态操作
///

class MovieVideoPlayerPage extends StatefulWidget {
  final MovieDetailEntity data;
  final int dataIndex;

  const MovieVideoPlayerPage({Key key, this.data, this.dataIndex})
      : super(key: key);

  @override
  _MovieVideoPlayerPageState createState() => _MovieVideoPlayerPageState();
}

class _MovieVideoPlayerPageState extends State<MovieVideoPlayerPage> {
  IjkMediaController _controller;

  @override
  void initState() {
    super.initState();
    StatusBarUtil.hideStatusBar();
    _controller = IjkMediaController();
    _controller
        .setNetworkDataSource(
            widget.data.trailers[widget.dataIndex].resourceUrl,
            autoPlay: true)
        .then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller.videoInfo.ratio,
          child: IjkPlayer(
            mediaController: _controller,
            statusWidgetBuilder: _buildStatusWidget,
            controllerWidgetBuilder: (ctx) => CustomIJKControllerWidget(
              controller: _controller,
              videoName: widget.data.trailers[widget.dataIndex].title,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusWidget(context, controller, status) {
    if (status == IjkStatus.preparing) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (status == IjkStatus.error) {
      return Center(
        child: Icon(
          Icons.error,
          color: Colors.white,
          size: ScreenUtil().setHeight(50),
        ),
      );
    } else if (status == IjkStatus.pause) {
      return Center(
        child: _buildCenterIconButton(Icons.play_arrow, controller.play),
      );
    } else {
      return Container();
    }
  }

  Widget _buildCenterIconButton(IconData iconData, Function onTap) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: BorderRadius.circular(30),
        ),
        child: IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: Icon(iconData),
          onPressed: onTap,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    StatusBarUtil.showStatusBar();
  }
}
