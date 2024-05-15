import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/app_string.dart';
import 'core/constants/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/router/router_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      navigatorKey: AppNavigatorKey.key,
      theme: AppThemes.darkTheme,
      initialRoute: AppRouter.initializer,
      onGenerateRoute: (RouteSettings settings) =>
          GeneratedRoute.onGenerateRoute(settings),
    );
  }
}
