import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/features/drawer/presentation/drawe_ui.dart';

import 'package:awoke_learning_app/features/gemini/presentation/screen_gemini.dart';
import 'package:awoke_learning_app/features/mainpage/presentation/main_page.dart';

import 'package:awoke_learning_app/features/home/providers/bottomnav_index_provider.dart';
import 'package:awoke_learning_app/features/mockclasses/presentation/screen_mockclass.dart';
import 'package:awoke_learning_app/features/users/presentation/screen_userpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final screenIndexprovider = Provider.of<BottomNavIndexProvider>(context);
    int currentScreenIndex = screenIndexprovider.fetchCurrentScreenIndex;
    final List<dynamic> screens = [
      HomeUiScreen(
        scaffoldKey: scaffoldKey,
      ),
      const ScreenMockClass(),
      const ScreenGemini(),
      const ScreenUserPage()
    ];
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 20,
              shadowColor: kBlackgrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SalomonBottomBar(
                currentIndex: currentScreenIndex,
                onTap: (value) => screenIndexprovider.updateScreenIndex(value),
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text("Home"),
                    selectedColor: Colors.purple,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.video_library),
                    title: const Text("Likes"),
                    selectedColor: kRedColor,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.search),
                    title: const Text("Search"),
                    selectedColor: Colors.orange,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.person),
                    title: const Text("Profile"),
                    selectedColor: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: screens[currentScreenIndex],
        drawer: const DrawerPageUi(),
      ),
    );
  }
}
