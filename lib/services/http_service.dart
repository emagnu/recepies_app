//  ///
//  Import LIBRARIES
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/const.dart';
//  Import FILES
//  //

class HTTPService {
  static final HTTPService _singleton = HTTPService._internal();

  final _dio = Dio();

  factory HTTPService() {
    return _singleton;
  }

  HTTPService._internal() {
    setup();
  }

  Future<void> setup({String? bearerToken}) async {
    final header = {
      'Content-Type': 'application/json',
    };
    final options = BaseOptions(
      baseUrl: API_BASE_URL,
      headers: header,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      },
    );
    _dio.options = options;
    // if (bearerToken != null) {_dio.options.headers['Authorization'] = 'Bearer $bearerToken';}
  }

  // Future<Response> get(String url, {Map<String, dynamic>? queryParameters, Options? options}) async {return _dio.get(url, queryParameters: queryParameters, options: options); }

  Future<Response?> post(String path, Map data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
