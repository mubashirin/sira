import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sira/state/search_chapter_state.dart';

class SearchChapter extends StatelessWidget {
  const SearchChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF4F6D7A),
      child: CupertinoTextField(
        autocorrect: true,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        prefix: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            CupertinoIcons.search,
            color: Color(0xFF4F6D7A),
          ),
        ),
        placeholder: 'Поиск',
        clearButtonMode: OverlayVisibilityMode.editing,
        onChanged: (currentText) {
          context.read<SearchChapterState>().updateText(currentText);
        },
      ),
    );
  }
}
