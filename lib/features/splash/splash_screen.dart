import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/app_assets.dart';
import '../../core/router/app_router.dart';
import '../../core/router/router_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleAnimation(
          duration: const Duration(milliseconds: 500),
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
                  await Future.delayed(const Duration(milliseconds: 2950))
                      .then((value) {
                    pushAndRemoveUntil(AppRouter.home);
                  });
                },
              ),
              Text(
                'News App',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
