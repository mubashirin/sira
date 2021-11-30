import 'package:flutter/material.dart';
import 'package:sira/model/sub_chapter_arguments.dart';
import 'package:sira/model/sub_chapter_model.dart';

class SubChapterItem extends StatelessWidget {
  const SubChapterItem({Key? key, required this.item, required this.index})
      : super(key: key);

  final SubChapterModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${item.subChapterName}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/content_chapter',
          arguments: SubChapterArguments(item.id),
        );
      },
    );
  }
}
