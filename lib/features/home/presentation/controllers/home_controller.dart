import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../account/presentation/screens/accrount_screen.dart';
import '../../../bookmark/presentation/screens/bookmark_screen.dart';
import '../../../news/presentation/screens/screen_imports.dart';

class HomeController extends GetxController {
  RxInt visit = 0.obs;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'News'),
    BottomNavigationBarItem(
        icon: Icon(FeatherIcons.bookmark), label: 'Bookmark'),
    BottomNavigationBarItem(icon: Icon(FeatherIcons.user), label: 'Account'),
  ];

  List<Widget> pages = const [NewsScreen(), BookmarkScreen(), AccountScreen()];

  void itemOntTap(int index) {
    visit.value = index;
  }
}
