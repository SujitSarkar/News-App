import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../../../account/presentation/controllers/account_controller.dart';
import '../../../news/domain/model/news_model.dart';
import '../controllers/bookmark_controller.dart';
import '../widgets/bookmark_tile.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    final BookmarkController bookmarkController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
      ),
      body: Obx(() => accountController.isUserLoggedIn.value
          ? _bookmarksWidget(context, bookmarkController)
          : const LogInRequiredWidget()),
    );
  }

  Widget _bookmarksWidget(
          BuildContext context, BookmarkController bookmarkController) =>
      StreamBuilder(
          stream: bookmarkController.getBookmarks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return NoDataFound(message: snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else if (snapshot.data!.docs.isEmpty) {
              return const NoDataFound(
                message:
                    'You didn\'t bookmark any news yet!\nBookmark news first.',
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final Map<String, dynamic> data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  final newsModel = NewsModel.fromMap(data,
                      dataSourceType: DataSourceType.firebase);
                  return BookmarkTile(newsModel: newsModel);
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          });
}
