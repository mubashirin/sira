import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/data/database_query.dart';
import 'package:sira/model/chapter_arguments.dart';
import 'package:sira/widgets/main_sub_chapters.dart';

class SubChapterPage extends StatelessWidget {
  SubChapterPage({Key? key}) : super(key: key);

  final _databseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final _arguments =
        ModalRoute.of(context)!.settings.arguments as ChapterArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Сира Пророка ﷺ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4F6D7A),
        elevation: 0,
      ),
      body: FutureBuilder<List>(
        future: _databseQuery.getOneSubChapter(_arguments.chapterID!),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Center(
                  child: Text('${snapshot.error}'),
                )
              : snapshot.hasData
                  ? MainSubchapters(snapshot: snapshot)
                  : Center(
                      child: Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                    );
        },
      ),
    );
  }
}
