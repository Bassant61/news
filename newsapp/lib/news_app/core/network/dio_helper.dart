import 'package:dio/dio.dart';
import 'package:newsapp/news_app/core/network/end_points.dart';

class DioHelper {
  DioHelper._();
  static late Dio _dio;

  static void initDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> getData({
    required String endPointPath,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await _dio.get(
      endPointPath,
      queryParameters: queryParameters,
    );
    return response;
  }

  static Future<Response> postData({
    required String endPointPath,
    Map<String, dynamic>? data,
  }) async {
    final Response response = await _dio.post(
      endPointPath,
      data: data,
    );
    return response;
  }
}