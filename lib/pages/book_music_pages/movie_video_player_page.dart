import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orientation/orientation.dart';
import 'package:video_player/video_player.dart';

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
  VideoPlayerController _controller;
  var opacity = 1.0;
  Timer timer;
  bool isPortrait = true;
  var pauseIcon;
  var playIcon;
  var currentIcon;

  // ignore: cancel_subscriptions
  StreamSubscription<DeviceOrientation> subscription;

  @override
  void initState() {
    super.initState();

    ///监听屏幕方向改变更新状态（因为两种状态下的UI有所不同）
    subscription = OrientationPlugin.onOrientationChange.listen((onData) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    pauseIcon = Container(
      key: ValueKey('pauseIcon'),
      child: Icon(
        Icons.pause,
        size: 28,
        color: Colors.white70,
      ),
    );
    playIcon = Container(
      key: ValueKey('playIcon'),
      child: Icon(
        Icons.play_arrow,
        size: 28,
        color: Colors.white70,
      ),
    );
    currentIcon = pauseIcon;

    ///将屏幕改变为自动改变方向
    setAutoOrientation();

    ///延时隐藏状态栏，主要是因为直接隐藏屏幕会跳动
    Future.delayed(Duration(milliseconds: 500), () {
      SystemChrome.setEnabledSystemUIOverlays([]);
    });

    timer = Timer(Duration(seconds: 3), () {
      opacity = 0.0;
      setState(() {});
    });

    _controller = VideoPlayerController.network(
//      'http://9890.vod.myqcloud.com/9890_4e292f9a3dd011e6b4078980237cc3d3.f20.mp4', //若豆瓣视频API失效了随便加一个
      widget.data.trailers[widget.dataIndex].resourceUrl,
      formatHint: VideoFormat.hls,
    )
      ..addListener(() {
        ///播放完毕自动退出
        _autoQuitWhenFinished();

        ///更新进度
        _onUpdatePlayerProgress();
      })
      ..initialize().then((_) {
        setState(() {
//          _controller.play();
        });
      });

    checkNetWorkType();
  }

  @override
  Widget build(BuildContext context) {
    ///每次刷新进入页面进行状态判断
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      isPortrait = true;
    } else {
      isPortrait = false;
    }

    if (!_controller.value.initialized) {
      return _emptyView();
    } else {
      return SafeArea(
        child: WillPopScope(
          ///监听退出,主要是安卓端
          onWillPop: () async {
            await _setQuitEffect();
            return Future.value(true);
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: <Widget>[_videoBody(), _playerTopBar()],
            ),
          ),
        ),
      );
    }
  }

  Widget _emptyView() {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          await _setQuitEffect();
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                _setQuitEffect().then((_) {
                  Navigator.pop(context);
                });
              },
              child: Container(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white70,
                ),
              ),
            ),
            title: Text(widget.data.trailers[widget.dataIndex].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          body: Center(
            child: Text('加载中...',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  ///视频播放控件
  Widget _videoBody() {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _videoView(),
          _playerControlBar(),
        ],
      ),
    );
  }

  ///视频播放的surface
  Widget _videoView() {
    return GestureDetector(
      onTap: () {
        if (opacity == 1.0) {
          opacity = 0.0;
        } else {
          opacity = 1.0;
        }
        resetTimer();
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  ///播放的顶部bar
  Widget _playerTopBar() {
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        alignment: Alignment.topCenter,
        child: Row(
          children: <Widget>[
            _backIcon(),
            _videoTitle(),
          ],
        ),
      ),
    );
  }

  ///播放控制bar
  Widget _playerControlBar() {
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(60),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20)),
        color: Colors.black38,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _playerStateIcon(),
            _videoIndicator(),
            _videoTimeText(),
            _orientationSwitcher(),
          ],
        ),
      ),
    );
  }

  ///显示播放状态的图标
  Widget _playerStateIcon() {
    var margin = isPortrait ? EdgeInsets.only(top: 5) : null;

    return GestureDetector(
      onTap: _controlPlayer,
      child: Container(
        margin: margin,
        child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          duration: Duration(milliseconds: 200),
          child: currentIcon,
        ),
      ),
    );
  }

  ///返回按钮
  Widget _backIcon() {
    return GestureDetector(
      onTap: () {
        if (opacity == 0.0) {
          setState(() {
            opacity = 1.0;
          });
          return;
        }
        _setQuitEffect().then((_) {
          Navigator.pop(context);
        });
      },
      child: Container(
        color: Colors.transparent,
        width: 60,
        margin: EdgeInsets.only(left: 10),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white70,
          size: 20,
        ),
      ),
    );
  }

  ///视频的标题
  Widget _videoTitle() {
    return Container(
      child: Text(
        this.widget.data.trailers[this.widget.dataIndex].title,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  ///控制拖动条
  Widget _videoIndicator() {
    return Expanded(
      child: Container(
        height: ScreenUtil().setHeight(30),
        margin: EdgeInsets.only(top: 2, left: 10),
        child: VideoProgressIndicator(
          _controller,
          colors: VideoProgressColors(
              bufferedColor: Colors.white54,
              backgroundColor: Colors.white12,
              playedColor: Colors.white),
          allowScrubbing: true,
        ),
      ),
    );
  }

  ///时间文字
  Widget _videoTimeText() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(10),
        left: ScreenUtil().setWidth(10),
        right: ScreenUtil().setWidth(20),
      ),
      child: Text(
        '${_controller.value.position.toString().substring(2, 7)}/${_controller.value.duration.toString().substring(2, 7)}',
        style: TextStyle(
            fontSize: 12, color: Colors.white70, fontWeight: FontWeight.w500),
      ),
    );
  }

  ///屏幕方向切换按钮
  Widget _orientationSwitcher() {
    return GestureDetector(
      onTap: () {
        if (opacity == 0.0) {
          opacity = 1.0;
          setState(() {});
          return;
        }
        _switchOrientation();
      },
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(5), right: ScreenUtil().setWidth(10)),
        child: Icon(
          isPortrait ? Icons.fullscreen : Icons.fullscreen_exit,
          color: Colors.white70,
        ),
      ),
    );
  }

  ///控制播放
  void _controlPlayer() async {
    ///播放暂停逻辑
    ///如果没有显示，那么就显示,并且不做播放暂停操作
    if (opacity != 1.0) {
      opacity = 1.0;
      resetTimer();
      setState(() {});
      return;
    }
    if (_controller.value.isPlaying) {
      setState(() {
        currentIcon = playIcon;
      });
      _controller.pause();
    } else {
      setState(() {
        currentIcon = pauseIcon;
      });
      _controller.play();
    }
    resetTimer();
  }

  ///设置在退出的时候做的一些操作
  Future _setQuitEffect() async {
    ///强制竖屏操作
    await OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);

    ///设置竖屏优先
    await OrientationPlugin.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    ///显示状态栏
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    ///这里是防止在返回太快导致原页面的状态问题
    await Future.delayed(Duration(milliseconds: 300));
  }

  ///播放完自动退出
  void _autoQuitWhenFinished() async {
    if (_controller.value.position == _controller.value.duration) {
      await _setQuitEffect();
      Navigator.pop(context);
    }
  }

  ///更新播放进度(如果不显示就不更新）
  void _onUpdatePlayerProgress() {
    if (opacity == 1.0) {
      setState(() {});
    }
  }

  void resetTimer() {
    ///如果测试计时器在计时，那么取消
    if (timer.isActive) {
      timer.cancel();
    }

    ///如果没有计时，那么开始计时，三秒后隐藏bar
    if (!timer.isActive) {
      timer = Timer(Duration(seconds: 3), () {
        opacity = 0.0;
        setState(() {});
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    _controller.dispose();
    timer.cancel();
  }

  ///改变屏幕方向
  void _switchOrientation() async {
    resetTimer();
    if (isPortrait) {
      await OrientationPlugin.forceOrientation(
          DeviceOrientation.landscapeRight);
    } else {
      await OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    }

    Future.delayed(Duration(milliseconds: 1500), () {
      setAutoOrientation();
    });
    await Future.delayed(Duration(milliseconds: 100));
    isPortrait = false;
    setState(() {});
  }

  ///自动感应方向状态
  void setAutoOrientation() {
    OrientationPlugin.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  ///检查网络状态
  void checkNetWorkType() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                height: ScreenUtil().setHeight(240),
                width: ScreenUtil().setWidth(500),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                      margin: EdgeInsets.only(
                          bottom: ScreenUtil().setHeight(40),
                          top: ScreenUtil().setHeight(20)),
                      child: Text(
                        '您目前在使用移动网络，观看将消耗流量,是否继续？',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: ScreenUtil().setSp(35),
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                    ),

                    ///下面的按钮
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(right: ScreenUtil().setWidth(40)),
                          child: CupertinoButton(
                              color: Colors.green,
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(10),
                                  horizontal: ScreenUtil().setWidth(40)),
                              minSize: ScreenUtil().setHeight(30),
                              pressedOpacity: 0.4,
                              child: Text('继续',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.pop(context);
                                _controller.play();
                              }),
                        ),
                        Container(
                          child: CupertinoButton(
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(10),
                                  horizontal: ScreenUtil().setWidth(40)),
                              minSize: ScreenUtil().setHeight(30),
                              pressedOpacity: 0.4,
                              child: Text('退出',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () async {
                                Navigator.pop(context);
                                await _setQuitEffect();
                                Navigator.pop(this.context);
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      _controller.play();
    }
  }
}
