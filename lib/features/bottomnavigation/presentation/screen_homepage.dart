import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/features/drawer/presentation/drawer_ui.dart';
import 'package:awoke_learning_app/features/gemini/presentation/screen_gemini.dart';
import 'package:awoke_learning_app/features/bottomnavigation/providers/bottomnav_index_provider.dart';
import 'package:awoke_learning_app/features/mainpage/presentation/main_page.dart';
import 'package:awoke_learning_app/features/mockclasses/presentation/screen_mockclass.dart';
import 'package:awoke_learning_app/features/primeusers/presentation/screen_userpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final screenIndexProvider = Provider.of<BottomNavIndexProvider>(context);
    int currentScreenIndex = screenIndexProvider.fetchCurrentScreenIndex;

    final List<Widget> screens = [
      HomeUiScreen(scaffoldKey: scaffoldKey),
      const ScreenMockClass(),
      ScreenGemini(),
      const ScreenPrimeUserPage(),
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
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 50),
                currentIndex: currentScreenIndex,
                onTap: (index) => screenIndexProvider.updateScreenIndex(index),
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text("Home"),
                    selectedColor: Colors.purple,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.video_library),
                    title: const Text("Mock Class"),
                    selectedColor: kRedColor,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.chat),
                    title: const Text("Gemini Ai"),
                    selectedColor: const Color(0xff1C368E),
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
        body: IndexedStack(
          index: currentScreenIndex,
          children: screens,
        ),
        drawer: const DrawerPageUi(),
      ),
    );
  }
}
