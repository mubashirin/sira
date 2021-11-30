import 'package:sira/model/chapter_model.dart';
import 'package:sira/model/content_model.dart';
import 'package:sira/model/sub_chapter_model.dart';

import 'database_helper.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<ChapterModel>> getAllChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<ChapterModel>? mainChapters = res.isNotEmpty
        ? res.map((c) => ChapterModel.fromMap(c)).toList()
        : null;
    return mainChapters!;
  }

  Future<List<SubChapterModel>> getOneSubChapter(int itemId) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_sub_chapter',
        where: 'displayBy = $itemId');
    List<SubChapterModel>? mainSubChapters = res.isNotEmpty
        ? res.map((c) => SubChapterModel.fromMap(c)).toList()
        : null;
    return mainSubChapters!;
  }

  Future<List<ContentModel>> getOneContentChapter(int itemId) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapter_content',
        where: 'displayBy = $itemId');
    List<ContentModel>? mainContent = res.isNotEmpty
        ? res.map((c) => ContentModel.fromMap(c)).toList()
        : null;
    return mainContent!;
  }

  Future<List<ChapterModel>> getAllFavorites() async {
    var dbClient = await con.db;
    var res =
        await dbClient.query('Table_of_chapters', where: 'favoriteState == 1');
    List<ChapterModel>? mainFavorites = res.isNotEmpty
        ? res.map((c) => ChapterModel.fromMap(c)).toList()
        : null;
    return mainFavorites!;
  }

  addRemoveFavoriteChapter(int state, int id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery(
        'UPDATE Table_of_chapters SET favoriteState = $state WHERE id == $id');
  }

  Future<List<ChapterModel>> getChapterSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM Table_of_chapters WHERE id LIKE '%$text%' OR chapterName LIKE '%$text%'");
    List<ChapterModel>? searchResult = res.isNotEmpty
        ? res.map((c) => ChapterModel.fromMap(c)).toList()
        : null;
    return searchResult!;
  }

  // Future<List<ChapterModelItem>> getFavoriteChapters() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
  //   List<ChapterModelItem>? favoriteChapters = res.isNotEmpty ? res.map((c) => ChapterModelItem.fromMap(c)).toList() : null;
  //   return favoriteChapters!;
  // }

  // Future<List<SupplicationModelItem>> getAllSupplications() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_supplications');
  //   List<SupplicationModelItem>? listSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
  //   return listSupplications!;
  // }

  // Future<List<SupplicationModelItem>> getSupplicationSearchResult(String text) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.rawQuery("SELECT * FROM Table_of_supplications WHERE _id LIKE '%$text%' OR content_translation LIKE '%$text%'");
  //   List<SupplicationModelItem>? searchResult = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
  //   return searchResult!;
  // }

  // addRemoveFavoriteSupplication(int state, int _id) async {
  //   var dbClient = await con.db;
  //   await dbClient.rawQuery('UPDATE Table_of_supplications SET favorite_state = $state WHERE _id == $_id');
  // }

  // Future<List<SupplicationModelItem>> getFavoriteSupplications() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_supplications', where: 'favorite_state == 1');
  //   List<SupplicationModelItem>? favoriteSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
  //   return favoriteSupplications!;
  // }

  // Future<List<SupplicationModelItem>> getContentChapter(int _id) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $_id');
  //   List<SupplicationModelItem>? chapterSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
  //   return chapterSupplications!;
  // }

  // Future<List<OtherModelItem>> getAboutUs() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_about_us');
  //   List<OtherModelItem>? aboutBook = res.isNotEmpty ? res.map((c) => OtherModelItem.fromMap(c)).toList() : null;
  //   return aboutBook!;
  // }

  // Future<List<OtherModelItem>> getAboutUsContent(int _id) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_about_us', where: '_id == $_id');
  //   List<OtherModelItem>? aboutBook = res.isNotEmpty ? res.map((c) => OtherModelItem.fromMap(c)).toList() : null;
  //   return aboutBook!;
  // }

  // Future<List<SupplicationDayNightItem>> getDayNightSupplications(bool dayNight) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query(dayNight ? 'Table_of_supplications_day' : 'Table_of_supplication_night');
  //   List<SupplicationDayNightItem>? dayNightSupplications = res.isNotEmpty ? res.map((c) => SupplicationDayNightItem.fromMap(c)).toList() : null;
  //   return dayNightSupplications!;
  // }
}
