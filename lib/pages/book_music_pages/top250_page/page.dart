import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/app_bar_component/component.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/persistent_header_component/component.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top250_list_adapter/adapter.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top_header_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class Top250Page extends Page<Top250State, Map<String, dynamic>> {
  Top250Page()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<Top250State>(
              adapter: NoneConn<Top250State>() + Top250ListAdapter(),
              slots: <String, Dependent<Top250State>>{
                'appBar': AppBarConnector() + AppBarComponent(),
                'topHeader': TopHeaderConnector() + TopHeaderComponent(),
                'persistentHeader':
                    PersistentHeaderConnector() + PersistentHeaderComponent()
              }),
          middleware: <Middleware<Top250State>>[],
        );
}
