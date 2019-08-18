import 'package:flutter_easyrefresh/easy_refresh.dart';

///
/// @created by 文景睿
/// description:自定义刷新脚布局
///
class RefreshFooter extends ClassicalFooter {
  @override
  String get loadingText => '加载中';

  @override
  String get loadedText => '加载完成';

  @override
  String get loadReadyText => '松手加载';

  @override
  String get loadFailedText => '加载失败';

  @override
  String get loadText => '上拉加载';

  @override
  String get noMoreText => '没有更多数据';

  @override
  bool get showInfo => false;
}
