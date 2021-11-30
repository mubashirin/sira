import 'package:flutter/material.dart';

class SearchChapterState with ChangeNotifier {
  String _searchText = '';
  String get getSearchText => _searchText;

  updateText(String newText) {
    _searchText = newText;
    notifyListeners();
  }
}
