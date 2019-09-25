import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_douban/util/constants.dart';

///
/// @created by 文景睿
/// description:网络请求工具类
///

class DioUtil {
  static DioUtil _dioUtil;
  Dio _dio;

  static DioUtil getInstance() {
    if (_dioUtil == null) {
      _dioUtil = DioUtil();
      _dioUtil._dio = Dio();
      _dioUtil._dio.options.baseUrl = Constants.BASE_URL;
    }
    return _dioUtil;
  }

  Future get(
      {@required String url, Map<String, dynamic> queryParameters}) async {
    Response response = await _dio.get(url, queryParameters: queryParameters);
    if (Constants.isDebug) {
      print('Http接口地址::' + url);
      print('Http回调数据::' + response.data.toString());
      print('完整URL:${Constants.BASE_URL + url}');
    }

    return response.data;
  }
}
