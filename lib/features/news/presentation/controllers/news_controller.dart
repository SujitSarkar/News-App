import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/news/data/news_service.dart';
import '../../domain/model/news_model.dart';

class NewsController extends GetxController {
  NewsController(this._newsService);
  final NewsService _newsService;

  RxBool isLoding = true.obs;
  RxList<NewsModel> newsList = <NewsModel>[].obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    final result = await _newsService.getNews();
    if (result != null) {
      newsList.clear();
      //Remove object from newsList where urlToImage is null
      for (var element in result) {
        if (element.urlToImage != null) {
          newsList.add(element);
        }
      }
      debugPrint('Total News: ${newsList.length}');
    }
    isLoding(false);
    update();
  }
}
