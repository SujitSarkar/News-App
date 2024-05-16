import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/widgets_imports.dart';
import '../../../../core/constants/app_string.dart';
import '../controllers/news_controller.dart';
import '../widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appName),
        centerTitle: true,
      ),
      body: ListRefreshIndicator(
          onRefresh: () async => await newsController.fetchNews(),
          child: Obx(
            () => newsController.isLoding.value
                ? const LoadingWidget()
                : newsController.newsList.isNotEmpty
                    ? ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => NewsTile(
                              newsModel: newsController.newsList[index],
                              fromPage: FromPage.home,
                            ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: newsController.newsList.length)
                    : NoDataFound(
                        onRefresh: () {
                          newsController.fetchNews();
                        },
                      ),
          )),
    );
  }
}
