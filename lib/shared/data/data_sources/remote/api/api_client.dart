part of 'remote_imports.dart';

class ApiClient extends CacheManager {
  late BaseOptions baseOptions;
  late Dio dio;
  Options options = Options();

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.baseUrl);
    dio = Dio(baseOptions);
    options =
        Options(headers: {'Authorization': 'Bearer ${ApiConstant.apiKey}'});
  }

  Future<Response> getRequest({required String path}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      try {
        return tryGetCachedResponse(path: path);
      } catch (error) {
        throw ApiException(message: error.toString());
      }
    } else {
      try {
        final Response response = await dio.get(path, options: options);
        await cacheResponse(path: path, response: response);
        logResponse(response);
        return response;
      } on DioException catch (e) {
        if (e.response != null) {
          throw ApiException(message: e.response?.statusMessage);
        } else {
          throw ApiException(message: e.message);
        }
      } catch (error) {
        throw ApiException(message: error.toString());
      }
    }
  }

  Future<Response> postRequest(
      {required String path, Map<String, dynamic>? body}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      try {
        return tryGetCachedResponse(path: path);
      } catch (error) {
        throw ApiException(message: error.toString());
      }
    } else {
      try {
        Response response = await dio.post(path, data: body, options: options);
        await cacheResponse(path: path, response: response);
        logResponse(response);
        return response;
      } on DioException catch (e) {
        if (e.response != null) {
          throw ApiException(message: e.response?.statusMessage);
        } else {
          throw ApiException(message: e.message);
        }
      }
    }
  }

  void logResponse(Response response) {
    debugPrint('URL         : ${response.requestOptions.uri}');
    debugPrint('STATUS CODE : ${response.statusCode}');
    debugPrint(
        'RESPONSE    : ${response.data.toString().substring(0, 500)}\n\n');
  }
}
