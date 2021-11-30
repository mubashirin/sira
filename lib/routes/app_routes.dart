import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sira/pages/chapter_content_page.dart';
import 'package:sira/pages/main_page.dart';
import 'package:sira/pages/sub_chapter_page.dart';

class AppRoutes {
  Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MainPage(), settings: routeSettings);
      case '/sub_chapter':
        return MaterialPageRoute(
            builder: (_) => SubChapterPage(), settings: routeSettings);
      case '/content_chapter':
        return MaterialPageRoute(
            builder: (_) => ChapterContentPage(), settings: routeSettings);
      default:
        throw Exception('Invalid Route');
    }
  }
}
