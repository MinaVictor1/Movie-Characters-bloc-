import 'package:breaking_bad/constant/strings.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';

class CharacterApi {
  late Dio dio;

  CharacterApi() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      RetryInterceptor(dio: dio, logPrint: print, retries: 3, retryDelays: [
        const Duration(seconds: 20),
        const Duration(seconds: 20),
        const Duration(seconds: 20),
      ], retryableExtraStatuses: {
        status403Forbidden
      }),
    );
  }
  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('character');
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        // print(response.data['results'].toString());
        return response.data['results'];
      }
      return [];
    } catch (e) {
      if (e is DioException) {
        debugPrint(e.message);
      } else {
        debugPrint(e.toString());
      }
      return [];
    }
  }
}
