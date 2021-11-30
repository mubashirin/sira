import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/model/chapter_arguments.dart';
import 'package:sira/model/chapter_model.dart';

class ChapterItem extends StatelessWidget {
  const ChapterItem({Key? key, required this.item, required this.index})
      : super(key: key);

  final ChapterModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bookmark,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                '${item.chapterName}',
                style: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/sub_chapter',
          arguments: ChapterArguments(item.id),
        );
      },
    );
  }
}
