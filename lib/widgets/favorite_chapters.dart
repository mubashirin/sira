import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sira/widgets/favorite_item.dart';

class FavoriteChapters extends StatelessWidget {
  const FavoriteChapters({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (contex, index) {
            return FavoriteItem(
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
