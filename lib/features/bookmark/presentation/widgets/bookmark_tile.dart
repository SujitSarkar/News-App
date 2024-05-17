import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../news/domain/model/news_model.dart';
import '../../../news/presentation/widgets/widget_imports.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkTile extends StatelessWidget {
  const BookmarkTile({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController = Get.find();
    return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              bookmarkController.removeBookmark(id: newsModel.id!);
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            label: 'Remove',
          ),
        ]),
        child: NewsTile(
          newsModel: newsModel,
          fromPage: FromPage.bookmark,
        ));
  }
}
