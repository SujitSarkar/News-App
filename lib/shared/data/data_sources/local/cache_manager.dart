import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../remote/api/api_exception.dart';

class CacheManager {
  static final storage = GetStorage();

  Future<Response> tryGetCachedResponse({required String path}) async {
    final cachedData = await storage.read(path);
    if (cachedData != null) {
      try {
        final Map<String, dynamic> dataMap = cachedData as Map<String, dynamic>;
        return Response(
            data: dataMap['data'],
            statusCode: dataMap['statusCode'] ?? 200,
            requestOptions: RequestOptions(path: path));
      } catch (error) {
        throw ApiException(message: 'Error getting cache data');
      }
    } else {
      throw ApiException(message: 'No cache data found with this path');
    }
  }

  Future<void> cacheResponse(
      {required String path, required Response response}) async {
    try {
      await storage.write(
          path, {'data': response.data, 'statusCode': response.statusCode});
      debugPrint('Cache successful with path $path');
    } on Exception catch (e) {
      debugPrint('Error caching response: ${e.toString()}');
    }
  }
}
