import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $HttpClientAdapter = Bind.singleton((i) => HttpClientAdapter());

class HttpClientAdapter {
  HttpClientAdapter() {
    client.options.connectTimeout = const Duration(seconds: 5);
    client.options.receiveTimeout = const Duration(seconds: 4);
  }

  final client = Dio();

  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Object? data,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
