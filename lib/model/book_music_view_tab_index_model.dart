///
/// @created by 文景睿
/// description:用于管理书影音tabView的实时索引的model
///
class BookMusicViewTabIndexModel {
  int _value = 0;

  void setIndexValue(newValue) {
    this._value = newValue;
  }

  int getIndexValue() {
    return _value;
  }
}
