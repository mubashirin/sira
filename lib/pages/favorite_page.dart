import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/data/database_query.dart';
import 'package:sira/state/add_remove_favorites_state.dart';
import 'package:sira/widgets/favorite_chapters.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<AddRemoveFavoritesState>().getUpdateList
          ? _databaseQuery.getAllFavorites()
          : _databaseQuery.getAllFavorites(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? FavoriteChapters(snapshot: snapshot)
            : Center(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    CupertinoIcons.bookmark,
                    size: 50,
                  ),
                  label: const Text(
                    'Избранных глав нет',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
      },
    );
  }
}
