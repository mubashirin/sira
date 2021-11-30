import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sira/pages/favorite_page.dart';
import 'package:sira/pages/shapter_page.dart';
import 'package:sira/state/main_state_page.dart';
import 'package:sira/state/search_chapter_state.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _mainPages = [
    ChapterPage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final _currentFocus = FocusScope.of(context);
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Сира Пророка ﷺ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF4F6D7A),
          elevation: 0,
        ),
        body: _mainPages[context.watch<MainPageState>().getBottomNavigationIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Главы',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Избранное',
            ),
          ],
          selectedItemColor: const Color(0xFF4F6D7A),
          unselectedItemColor: const Color(0xFF84B9D4),
          currentIndex: context.watch<MainPageState>().getBottomNavigationIndex,
          onTap: (index) {
            context.read<MainPageState>().updateIndex(index);
            context.read<SearchChapterState>().cleanValue();
          }
        ),
      ),
      onTap: () {
        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
    );
  }
}
