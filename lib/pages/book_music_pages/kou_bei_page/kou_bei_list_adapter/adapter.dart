import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/kou_bei_list_adapter/kou_bei_list_item_component/component.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/kou_bei_list_adapter/kou_bei_list_item_component/state.dart';

import '../state.dart';

class KouBeiListAdapter extends DynamicFlowAdapter<KouBeiState> {
  KouBeiListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item': KouBeiListItemComponent(),
          },
          connector: _KouBeiListConnector(),
        );
}

class _KouBeiListConnector extends ConnOp<KouBeiState, List<ItemBean>> {
  @override
  List<ItemBean> get(KouBeiState state) {
    List<ItemBean> list = List();
    for (var item in state.itemList) {
      list.add(ItemBean('item', item));
    }
    return list;
  }

  @override
  void set(KouBeiState state, List<ItemBean> items) {
    List<KouBeiListItemState> list = List();
    for (var item in items) {
      list.add(item.data);
    }

    state.itemList = list;
  }
}
