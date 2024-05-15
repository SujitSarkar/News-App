import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../shared/data/data_sources/remote/api/api_endpoint_url.dart';
import '../../../shared/data/data_sources/remote/api/remote_imports.dart';
import '../domain/model/news_model.dart';
import '../domain/repository/news_repository.dart';

class NewsService extends ApiClient implements NewsRepository {
  @override
  Future<List<NewsModel>?> getNews() async {
    try {
      final response = await getRequest(path: ApiEndpointUrl.topHeadline);
      if (response.statusCode == 200) {
        return newsModelFromJson(jsonEncode(response.data['articles']));
      }
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
