class ChapterModel {
  int? id;
  String? chapterName;

  ChapterModel(this.id, this.chapterName);

  ChapterModel.fromMap(dynamic object) {
    id = object['id'];
    chapterName = object['chapterName'];
  }
}
