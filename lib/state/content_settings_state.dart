import 'package:flutter/cupertino.dart';

class ContentSettingsState with ChangeNotifier {
  int _currentTextSize = 18;

  int get getCurrentTextSize => _currentTextSize;
  updateTextSize(int newSize) {
    _currentTextSize = newSize;
    notifyListeners();
  }
}