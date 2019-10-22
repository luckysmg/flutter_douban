import 'package:flutter_douban/model/base_model.dart';

class MovieDetailTitleModel extends BaseModel {
  var opacity = 1.0;

  void update(double opacity) {
    this.opacity = opacity;
    notifyListeners();
  }
}
