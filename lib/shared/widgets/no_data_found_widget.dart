part of 'widgets_imports.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, this.message, this.onRefresh});
  final String? message;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message ?? 'No data found !',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.grey),
          ),
          if (onRefresh != null)
            TextButton(
              onPressed: onRefresh,
              child: Text(
                'Refresh',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.secondaryColor),
              ),
            )
        ],
      ),
    ).paddingAll(16);
  }
}
