import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/data/database_query.dart';
import 'package:sira/state/add_remove_favorites_state.dart';
import 'package:sira/state/search_chapter_state.dart';
import 'package:sira/widgets/main_chapters.dart';
import 'package:sira/widgets/search_chapter.dart';
import 'package:provider/provider.dart';

class ChapterPage extends StatelessWidget {
  ChapterPage({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchChapter(),
        FutureBuilder<List>(
          future:
              context.watch<SearchChapterState>().getSearchText.isNotEmpty ||
                      context.watch<AddRemoveFavoritesState>().getUpdateList
                  ? _databaseQuery.getChapterSearchResult(
                      context.watch<SearchChapterState>().getSearchText)
                  : _databaseQuery.getAllChapters(),
          builder: (context, snapshot) {
            return snapshot.hasError
                ? const Expanded(
                    child: Center(
                      child: Text(
                        'По вашиму запросу ничего не найдено',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : snapshot.hasData
                    ? Expanded(
                        child: MainChapters(
                          snapshot: snapshot,
                        ),
                      )
                    : Center(
                        child: Platform.isAndroid
                            ? const CircularProgressIndicator()
                            : const CupertinoActivityIndicator(),
                      );
          },
        ),
      ],
    );
  }
}
