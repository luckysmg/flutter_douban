import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

///
/// @created by 文景睿
/// description:一周口碑榜的appbar下面的header
///
class TopHeaderComponent extends Component<TopHeaderState> {
  TopHeaderComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<TopHeaderState>(
              slots: <String, Dependent<TopHeaderState>>{}),
        );
}
