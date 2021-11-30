import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/data/database_query.dart';
import 'package:sira/widgets/main_chapters.dart';
import 'package:sira/widgets/search_chapter.dart';

class ChapterPage extends StatelessWidget {
  ChapterPage({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllChapters(),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? Center(
                child: Text('${snapshot.error}'),
              )
            : snapshot.hasData
                ? Column(
                    children: [
                      SearchChapter(),
                      Expanded(
                        child: MainChapters(
                          snapshot: snapshot,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator()
                        : CupertinoActivityIndicator());
      },
    );
  }
}
