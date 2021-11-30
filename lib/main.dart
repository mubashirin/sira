import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sira/routes/app_routes.dart';
import 'package:sira/state/add_remove_favorites_state.dart';
import 'package:sira/state/content_settings_state.dart';
import 'package:sira/state/main_state_page.dart';
import 'package:sira/state/search_chapter_state.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {

  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainPageState()),
        ChangeNotifierProvider(create: (_) => SearchChapterState()),
        ChangeNotifierProvider(create: (_) => AddRemoveFavoritesState()),
        ChangeNotifierProvider(create: (_) => ContentSettingsState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Сира Пророка ﷺ',
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
        onGenerateRoute: AppRoutes().onGeneratorRoute,
        initialRoute: '/',
      ),
    );
  }
}
