import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class CelebrityPhotosComponent extends Component<CelebrityPhotosState> {
  CelebrityPhotosComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<CelebrityPhotosState>(
                adapter: null,
                slots: <String, Dependent<CelebrityPhotosState>>{
                }),);

}
