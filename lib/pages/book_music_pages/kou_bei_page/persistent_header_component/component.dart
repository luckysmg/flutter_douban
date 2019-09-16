import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class PersistentHeaderComponent extends Component<PersistentHeaderState> {
  PersistentHeaderComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<PersistentHeaderState>(
                adapter: null,
                slots: <String, Dependent<PersistentHeaderState>>{
                }),);

}
