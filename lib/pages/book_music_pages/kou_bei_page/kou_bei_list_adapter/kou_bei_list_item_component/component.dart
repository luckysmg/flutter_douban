import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class KouBeiListItemComponent extends Component<KouBeiListItemState> {
  KouBeiListItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<KouBeiListItemState>(
                adapter: null,
                slots: <String, Dependent<KouBeiListItemState>>{
                }),);

}
