import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/state.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top250_list_adapter/kou_bei_list_item_component/component.dart';
import 'package:flutter_douban/pages/book_music_pages/top250_page/top250_list_adapter/kou_bei_list_item_component/state.dart';

class Top250ListAdapter extends DynamicFlowAdapter<Top250State> {
  Top250ListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item': Top250ListItemComponent(),
          },
          connector: _Top250Connector(),
        );
}

class _Top250Connector extends ConnOp<Top250State, List<ItemBean>> {
  @override
  List<ItemBean> get(Top250State state) {
    List<ItemBean> list = List();
    for (var item in state.list) {
      list.add(ItemBean('item', item));
    }
    return list;
  }

  @override
  void set(Top250State state, List<ItemBean> items) {
    List<Top250ListItemState> list = List();
    for (var item in items) {
      list.add(item.data);
    }

    state.list = list;
  }
}
