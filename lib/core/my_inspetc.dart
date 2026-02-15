import 'package:dio/dio.dart';

import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/core/constants.dart';

class MyInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"x-api-key": Constants.apiKey});

    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) {
    handler.next(response);
  }
}