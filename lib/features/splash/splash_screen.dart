import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_string.dart';
import '../../core/router/app_router.dart';
import '../../core/router/router_imports.dart';
import '../account/data/account_service.dart';
import '../account/presentation/controllers/account_controller.dart';
import '../bookmark/data/bookmark_service.dart';
import '../bookmark/presentation/controllers/bookmark_controller.dart';
import '../news/data/news_service.dart';
import '../news/presentation/controllers/news_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void dependencyInjection() {
    Get.put(NewsController(NewsService()));
    Get.put(AccountController(AccountService()));
    Get.put(BookmarkController(BookmarkService()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.splashLittieAsset,
              width: 300,
              fit: BoxFit.fitWidth,
              onLoaded: (p0) async {
                debugPrint(p0.duration.inSeconds.toString());
                dependencyInjection();
                await Future.delayed(const Duration(milliseconds: 2940))
                    .then((value) {
                  pushAndRemoveUntil(AppRouter.home);
                });
              },
            ),
            Text(
              AppString.appName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
