import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/account/presentation/screens/accrount_screen.dart';
import '../../core/constants/app_color.dart';
import '../bookmark/presentation/screens/bookmark_screen.dart';
import '../news/presentation/screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int visit = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'News'),
    BottomNavigationBarItem(
        icon: Icon(FeatherIcons.bookmark), label: 'Bookmark'),
    BottomNavigationBarItem(icon: Icon(FeatherIcons.user), label: 'Account'),
  ];

  List<Widget> pages = const [NewsScreen(), BookmarkScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: visit,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: visit,
        onTap: (value) => setState(() => visit = value),
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
        elevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
      ),
    );
  }
}
