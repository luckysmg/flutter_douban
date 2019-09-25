import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

///
/// @created by 文景睿
/// description:一周口碑榜的appbar下面的吸顶header
///
class PersistentHeaderComponent extends Component<PersistentHeaderState> {
  PersistentHeaderComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<PersistentHeaderState>(
              adapter: null,
              slots: <String, Dependent<PersistentHeaderState>>{}),
        );
}
