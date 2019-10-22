import 'package:flutter_douban/model/base_model.dart';

class MovieDetailIndicatorModel extends BaseModel {
  var opacity = 0.0;
  var currentOffsetY = 0.0;

  void update(double opacity, double currentOffsetY) {
    this.opacity = opacity;
    this.currentOffsetY = currentOffsetY;
    notifyListeners();
  }
}
