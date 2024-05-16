import 'package:flutter/material.dart';
import 'package:news_app/shared/utils/app_toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInAppWebView({required String url}) async {
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
  } catch (error) {
    debugPrint('Error launching Google Maps: $error');
    showToast(error.toString());
  }
}
