import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/widgets/sub_chapter_item.dart';

class MainSubchapters extends StatelessWidget {
  const MainSubchapters({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (contex, index) {
            return SubChapterItem(
              item: snapshot.data![index],
              index: index,
            );
          },
          separatorBuilder: (contex, index) {
            return const Divider(
              indent: 16,
              endIndent: 16,
            );
          },
          itemCount: snapshot.data!.length,
        ),
      ),
    );
  }
}
