import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/router_imports.dart';
import '../../../../features/news/data/news_service.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../bookmark/data/bookmark_service.dart';
import '../../domain/model/news_model.dart';

class NewsController extends GetxController {
  NewsController(this._newsService);
  final NewsService _newsService;

  final RxBool isLoding = true.obs;
  final RxBool functionLoading = false.obs;
  final RxList<NewsModel> newsList = <NewsModel>[].obs;

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
  }

  Future<void> saveBookmark({required NewsModel newsModel}) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      functionLoading(true);
      await BookmarkService.instance
          .isBookmarkExists(urlToImage: newsModel.urlToImage!)
          .then((value) async {
        if (!value) {
          final result =
              await BookmarkService.instance.saveBookmark(newsModel: newsModel);
          if (result) {
            showToast('News Bookmarked');
          }
        } else {
          showToast('Already exist in bookmark');
        }
      });
      functionLoading(false);
    } else {
      pushTo(AppRouter.login);
    }
  }
}
