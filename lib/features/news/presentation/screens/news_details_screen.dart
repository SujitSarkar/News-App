part of 'screen_imports.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen(
      {super.key, required this.newsModel, required this.fromPage});
  final NewsModel newsModel;
  final FromPage fromPage;

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find();
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: AppColors.primaryColor.withOpacity(0.5),
        child: IconButton(
            onPressed: () => popScreen(),
            icon: Icon(
              !kIsWeb && Platform.isIOS
                  ? CupertinoIcons.back
                  : FeatherIcons.arrowLeft,
              color: Colors.white,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      bottomNavigationBar: Obx(() => SizedBox(
            height: 60,
            child: SolidButton(
                onTap: () {
                  newsController.saveBookmark(newsModel: newsModel);
                },
                isLoading: newsController.functionLoading.value,
                child: Text(
                  'Bookmark',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                )).paddingSymmetric(horizontal: 16, vertical: 8),
          )),
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Widget _bodyUI(BuildContext context) => SingleChildScrollView(
        child: Column(children: [
          //News Imgage
          Hero(
            tag: Key('${fromPage.name}/${newsModel.urlToImage}'),
            child: CachedNetworkImage(
              imageUrl: newsModel.urlToImage!,
              errorWidget: (context, url, error) =>
                  const ImagePlaceholderWidget(),
              placeholder: (context, url) => const ImagePlaceholderWidget(
                height: 280,
                width: double.infinity,
              ),
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),

          //News Meta Data
          NewsMetaDataWidget(
            newsModel: newsModel,
          ).paddingAll(16),

          //News Title
          Text(newsModel.title ?? 'Not found',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold))
              .paddingSymmetric(horizontal: 16),

          //News Description
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              text: newsModel.description ?? 'Not found',
              children: [
                TextSpan(
                    text: '...read more',
                    style: const TextStyle(color: AppColors.secondaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        pushTo(AppRouter.readMore,
                            arguments:
                                ReadMoreScreen(url: newsModel.url ?? ''));
                      }),
              ],
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 12),
        ]),
      );
}
