part of 'screen_imports.dart';

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
