import 'package:flutter/material.dart';

class BottomNavIndexProvider extends ChangeNotifier {
  int screenIndex = 0; //initial index of the screen
  int get fetchCurrentScreenIndex {
    //function to return the current Screen index
    return screenIndex;
  }

  void updateScreenIndex(int newIndex) {
    //function to update the screenIndex
    screenIndex = newIndex;
    notifyListeners(); // this will notify listeners that the Screen index has been changed
  }
}
