import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constants/app_color.dart';
import '../../../../shared/widgets/widgets_imports.dart';
import '../../domain/model/news_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Ink(
        decoration: const BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CachedNetworkImage(
                imageUrl: newsModel.urlToImage!,
                errorWidget: (context, url, error) =>
                    const ImagePlaceholderWidget(),
                placeholder: (context, url) => const ImagePlaceholderWidget(),
                width: 130,
                height: 100,
                fit: BoxFit.fitHeight,
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
                Text(
                    DateFormat('MMM dd, yyyy').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            newsModel.publishedAt!)),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.hintColor,
                        fontWeight: FontWeight.bold))
              ],
            ).paddingAll(8))
          ],
        ),
      ),
    );
  }
}
