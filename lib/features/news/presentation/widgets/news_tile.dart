import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/router_imports.dart';
import '../../../../shared/widgets/widgets_imports.dart';
import '../../domain/model/news_model.dart';
import '../screens/news_details_screen.dart';

enum FromPage { home, bookmark }

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsModel, required this.fromPage});
  final NewsModel newsModel;
  final FromPage fromPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(AppRouter.newsDetails,
            arguments:
                NewsDetailsScreen(newsModel: newsModel, fromPage: fromPage));
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Ink(
        height: 110,
        decoration: const BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: Key('${fromPage.name}/${newsModel.urlToImage}'),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: newsModel.urlToImage!,
                  errorWidget: (context, url, error) =>
                      const ImagePlaceholderWidget(),
                  placeholder: (context, url) => const ImagePlaceholderWidget(),
                  width: 130,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsModel.title!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(newsModel.source!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: AppColors.hintColor,
                                  fontWeight: FontWeight.bold)),
                    ),
                    Text(
                        DateFormat('MMM dd, yyyy').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                newsModel.publishedAt!)),
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: AppColors.hintColor,
                                fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 8, vertical: 6))
          ],
        ),
      ),
    );
  }
}
