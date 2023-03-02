class BannerModel {
  final String? categoryId;
  final String? collectionId;
  final String? id;
  final String? thumbnail;

  BannerModel({
    this.categoryId,
    this.collectionId,
    this.id,
    this.thumbnail,
  });

  factory BannerModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return BannerModel(
      categoryId: jsonObject["categoryId"],
      collectionId: jsonObject['collectionId'],
      id: jsonObject['id'],
      thumbnail:
          'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
