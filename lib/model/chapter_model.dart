class ChapterModel {
  int? id;
  String? chapterName;
  int? favoriteState;

  ChapterModel(this.id, this.chapterName);

  ChapterModel.fromMap(dynamic object) {
    id = object['id'];
    chapterName = object['chapterName'];
    favoriteState = object['favoriteState'];
  }
}
