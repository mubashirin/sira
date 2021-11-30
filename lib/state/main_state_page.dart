import 'package:flutter/material.dart';

class MainPageState with ChangeNotifier {
  int _bottomNavigationIndex = 0;

  int get getBottomNavigationIndex => _bottomNavigationIndex;

  updateIndex(int newIndex) {
    _bottomNavigationIndex = newIndex;
    notifyListeners();
  }
}
