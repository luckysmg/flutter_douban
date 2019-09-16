import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class TopHeaderComponent extends Component<TopHeaderState> {
  TopHeaderComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<TopHeaderState>(
              slots: <String, Dependent<TopHeaderState>>{}),
        );
}
