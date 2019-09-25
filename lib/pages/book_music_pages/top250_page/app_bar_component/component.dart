import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

///
/// @created by 文景睿
/// description:一周口碑榜的appbar
///
class AppBarComponent extends Component<AppBarState> {
  AppBarComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<AppBarState>(
              adapter: null, slots: <String, Dependent<AppBarState>>{}),
        );
}
