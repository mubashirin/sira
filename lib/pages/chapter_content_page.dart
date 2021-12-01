import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sira/data/database_query.dart';
import 'package:sira/model/sub_chapter_arguments.dart';
import 'package:sira/state/content_settings_state.dart';
import 'package:sira/widgets/content_settings.dart';
import 'package:provider/provider.dart';

class ChapterContentPage extends StatelessWidget {
  ChapterContentPage({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final _arguments =
        ModalRoute.of(context)!.settings.arguments as SubChapterArguments;
    return FutureBuilder<List>(
      future: _databaseQuery.getOneContentChapter(_arguments.subChapterID!),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? Center(
                child: Text('${snapshot.error}'),
              )
            : snapshot.hasData
                ? Scaffold(
                    body: CupertinoScrollbar(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            floating: true,
                            pinned: false,
                            snap: false,
                            title: const Text(
                              'Сира Пророка ﷺ',
                              style: TextStyle(color: Colors.white),
                            ),
                            centerTitle: true,
                            backgroundColor: const Color(0xFF4F6D7A),
                            elevation: 0,
                            actions: [
                              IconButton(
                                icon: const Icon(Icons.settings),
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return const ContentSettings();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 16),
                                  child: Wrap(
                                    children: [
                                      Container(
                                        width: double.maxFinite,
                                        margin: const EdgeInsets.only(
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                            bottom: 8),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4F6D7A),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${_arguments.subChapterName}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: context
                                                  .watch<ContentSettingsState>()
                                                  .getCurrentTextSize
                                                  .toDouble(),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              childCount: 1,
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 16),
                                  child: Html(
                                    onLinkTap: (String? url,
                                        RenderContext rendContext,
                                        Map<String, String> attributes,
                                        element) {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoActionSheet(
                                          message: Html(
                                            data: url,
                                            style: {
                                              '#': Style(
                                                padding: EdgeInsets.zero,
                                                margin: EdgeInsets.zero,
                                                fontSize: const FontSize(18),
                                              ),
                                              'small': Style(
                                                color: Colors.grey,
                                                fontSize: const FontSize(10),
                                              ),
                                            },
                                          ),
                                          actions: [
                                            CupertinoButton(
                                              child: const Text(
                                                'Закрыть',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    data:
                                        '${snapshot.data![_arguments.subChapterID!].chapterContent}',
                                    style: {
                                      '#': Style(
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero,
                                        fontSize: const FontSize(19),
                                      ),
                                      'a': Style(
                                        fontSize: const FontSize(16),
                                        color: Colors.blue,
                                      ),
                                      'small': Style(
                                        fontSize: const FontSize(12),
                                        color: Colors.grey,
                                      ),
                                    },
                                  ),
                                );
                              },
                              childCount: 1
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Platform.isAndroid
                        ? const CircularProgressIndicator()
                        : const CupertinoActivityIndicator(),
                  );
      },
    );
  }
}
