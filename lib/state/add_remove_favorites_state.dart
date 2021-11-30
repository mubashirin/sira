import 'package:flutter/material.dart';
import 'package:sira/data/database_query.dart';

class AddRemoveFavoritesState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();
  bool _updateList = true;
  bool get getUpdateList => _updateList;

  updateFavoriteButtonState(int state, int itemState) {
    _databaseQuery.addRemoveFavoriteChapter(state, itemState);
    _updateList = !_updateList;
    notifyListeners();
  }
}
