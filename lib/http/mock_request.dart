import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

///
/// @created by 文景睿
/// description:模拟网络请求工具类
///

class MockRequest {
  static Future mock(String action, {Map params}) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    print(action + responseJson.toString());
    return responseJson;
  }
}