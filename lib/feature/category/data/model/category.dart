class Category {
  final String? collectionId;
  final String? id;
  final String? thumbnail;
  final String? title;
  final String? color;
  final String? icon;

  Category({
    this.collectionId,
    this.id,
    this.thumbnail,
    this.title,
    this.color,
    this.icon,
  });

  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category(
      collectionId: jsonObject['collectionId'],
      id: jsonObject['id'],
      thumbnail:
          'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      title: jsonObject['title'],
      color: jsonObject['color'],
      icon:
          'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
    );
  }
}
