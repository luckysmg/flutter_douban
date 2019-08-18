import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:存放各种装饰
///
class Decorations {
  static final homeButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.green[400]),
  );

  static final movieGridPubDataDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(3),
    border: Border.fromBorderSide(BorderSide(color: Colors.red, width: 1.2)),
  );
}
