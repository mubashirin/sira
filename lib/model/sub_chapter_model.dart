class SubChapterModel {
  int? id;
  String? subChapterName;

  SubChapterModel(this.id, this.subChapterName);

  SubChapterModel.fromMap(dynamic object) {
    id = object['id'];
    subChapterName = object['subChapterName'];
  }
}
