import 'package:dio/dio.dart';
import 'package:flutter_douban/util/constants.dart';

///
/// @created by 文景睿
/// description:真实网络请求工具类
///

class DioUtil {
  Future get(String url, Map map) async {
    Response response =
        await Dio().get(Constants.BASE_URL + url, queryParameters: map);

    if (Constants.isDebug) {
      print('回调数据::' + response.data.toString());
    }
    return response.data;
  }
}
