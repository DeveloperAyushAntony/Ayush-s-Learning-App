import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/features/gemini/presentation/screen_gemini.dart';
import 'package:awoke_learning_app/features/home/presentation/screen_homepage.dart';
import 'package:awoke_learning_app/features/mainpage/providers/bottomnav_index_provider.dart';
import 'package:awoke_learning_app/features/mockclasses/presentation/screen_mockclass.dart';
import 'package:awoke_learning_app/features/users/presentation/screen_userpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<dynamic> screens = [
    const ScreenHome(),
    const ScreenMockClass(),
    const ScreenGemini(),
    const ScreenUserPage()
  ];

  @override
  Widget build(BuildContext context) {
    final screenIndexprovider = Provider.of<BottomNavIndexProvider>(context);
    int currentScreenIndex = screenIndexprovider.fetchCurrentScreenIndex;
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shadowColor: kBlackgrey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SalomonBottomBar(
              currentIndex: currentScreenIndex,
              onTap: (value) => screenIndexprovider.updateScreenIndex(value),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedColor: Colors.purple,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(Icons.favorite_border),
                  title: const Text("Likes"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.search),
                  title: const Text("Search"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
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
    );
  }
}
