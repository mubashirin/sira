class ContentModel {
  int? id;
  String? chapterContent;

  ContentModel(this.id, this.chapterContent);

  ContentModel.fromMap(dynamic object) {
    id = object['id'];
    chapterContent = object['chapterContent'];
  }
}
