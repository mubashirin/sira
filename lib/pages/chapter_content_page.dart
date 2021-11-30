import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/data/database_query.dart';
import 'package:sira/model/sub_chapter_arguments.dart';

class ChapterContentPage extends StatelessWidget {
  ChapterContentPage({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final _arguments =
        ModalRoute.of(context)!.settings.arguments as SubChapterArguments;
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
        future: _databaseQuery.getOneContentChapter(_arguments.subChapterID!),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Center(
                  child: Text('${snapshot.error}'),
                )
              : snapshot.hasData
                  ? CupertinoScrollbar(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '${snapshot.data![_arguments.subChapterID!].chapterContent}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    )
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
