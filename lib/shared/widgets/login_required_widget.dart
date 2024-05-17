part of 'widget_imports.dart';

class LogInRequiredWidget extends StatelessWidget {
  const LogInRequiredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'No user found! Please login',
            style: Theme.of(context).textTheme.bodyMedium,
          ).paddingSymmetric(horizontal: 16, vertical: 12),
          SolidButton(
              width: 120,
              onTap: () {
                pushTo(AppRouter.login);
              },
              child: Text(
                'Sign In',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
