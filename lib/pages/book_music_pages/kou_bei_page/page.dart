import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/app_bar_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

///
/// @created by 文景睿
/// description:这个页面开始用的是FishRedux状态管理进行构建
///
class KouBeiPage extends Page<KouBeiState, Map<String, dynamic>> {
  KouBeiPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<KouBeiState>(
            adapter: null,
            slots: <String, Dependent<KouBeiState>>{
              'appBar': AppBarConnector() + AppBarComponent(),
            },
          ),
        );
}
