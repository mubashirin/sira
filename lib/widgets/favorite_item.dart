import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/model/chapter_arguments.dart';
import 'package:sira/model/chapter_model.dart';
import 'package:provider/provider.dart';
import 'package:sira/state/add_remove_favorites_state.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.item, required this.index})
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
              icon: Icon(
                item.favoriteState == 1
                    ? CupertinoIcons.bookmark_solid
                    : CupertinoIcons.bookmark,
              ),
              onPressed: () {
                context
                    .read<AddRemoveFavoritesState>()
                    .updateFavoriteButtonState(
                        item.favoriteState == 0 ? 1 : 0, item.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color(0xFF4F6D7A),
                    content: item.favoriteState == 0
                        ? const Text(
                            'Добавлено',
                            style: TextStyle(fontSize: 18),
                          )
                        : const Text(
                            'Удалено',
                            style: TextStyle(fontSize: 18),
                          ),
                    duration: const Duration(milliseconds: 500),
                  ),
                );
              },
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
