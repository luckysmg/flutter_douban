import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class Top250ListItemComponent extends Component<Top250ListItemState> {
  Top250ListItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<Top250ListItemState>(
              adapter: null, slots: <String, Dependent<Top250ListItemState>>{}),
        );
}
