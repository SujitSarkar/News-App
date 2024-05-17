part of 'widget_imports.dart';

class NewsMetaDataWidget extends StatelessWidget {
  const NewsMetaDataWidget({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.account_circle,
          color: AppColors.secondaryColor,
          size: 30,
        ).paddingOnly(right: 4),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Author
              Text(newsModel.author ?? 'Not found',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              //Date
              Text(
                  DateFormat('MMM dd, yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          newsModel.publishedAt!)),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.hintColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.public,
                color: AppColors.hintColor,
                size: 18,
              ).paddingOnly(right: 4),
              //Source
              Expanded(
                child: Text(newsModel.source ?? 'Not found',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.hintColor,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        )
      ],
    );
  }
}
