part of 'widget_imports.dart';

class ReadMoreScreen extends StatelessWidget {
  const ReadMoreScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReadMoreController>(
        init: ReadMoreController(url),
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: Obx(() => Text(controller.title.value)),
              titleSpacing: 0.0,
              leading: IconButton(
                onPressed: () {
                  popUntilOf(AppRouter.newsDetails);
                },
                icon: Icon(!kIsWeb && Platform.isIOS
                    ? CupertinoIcons.back
                    : FeatherIcons.arrowLeft),
              ),
            ),
            body: _bodyUI(controller)));
  }

  Obx _bodyUI(ReadMoreController controller) => Obx(() => Stack(
        alignment: Alignment.center,
        children: [
          Column(
              children: [
            if (controller.progress.value != 1.0 &&
                controller.reloading.value == false)
              LinearProgressIndicator(
                value: controller.progress.value,
                color: AppColors.secondaryColor,
              ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: WebUri.uri(Uri.parse(controller.url.value))),
                pullToRefreshController: controller.pullToRefreshController,
                onWebViewCreated: (updatedController) {
                  controller.webViewController = updatedController;
                },
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  allowsInlineMediaPlayback: true,
                  preferredContentMode: UserPreferredContentMode.MOBILE,
                ),
                onProgressChanged:
                    (InAppWebViewController? updatedController, int? progress) {
                  controller.updateProgress(updatedController, progress);
                },
                onLoadStop: (updatedController, url) async {
                  controller.pullToRefreshController.endRefreshing();
                },
                onReceivedError: (updatedController, url, error) {
                  controller.pullToRefreshController.endRefreshing();
                },
                onUpdateVisitedHistory:
                    (updatedController, url, androidIsReload) async {
                  controller.updateUrl(url.toString());
                },
              ),
            )
            // ignore: unnecessary_null_comparison
          ].where((Object o) => o != null).toList()),
        ],
      ));
}
