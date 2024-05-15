import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/widgets_imports.dart';
import '../../../../core/constants/app_string.dart';
import '../../data/news_service.dart';
import '../controllers/news_controller.dart';
import '../widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(NewsService()),
        builder: (newsController) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppString.appName),
              centerTitle: true,
            ),
            body: ListRefreshIndicator(
              onRefresh: () async => await newsController.fetchNews(),
              child: newsController.isLoding.value
                  ? const LoadingWidget()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      addAutomaticKeepAlives: false,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          NewsTile(newsModel: newsController.newsList[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: newsController.newsList.length),
            ),
          );
        });
  }
}
