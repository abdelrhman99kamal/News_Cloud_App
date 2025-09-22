class ArticleModel {
  final String? title;
  final String? subTitle;
  final String? image;
  final String? url;
  final String? categoryName;

  ArticleModel({
    required this.url,
    required this.categoryName,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  factory ArticleModel.fromJson(json, {required String categoryName}) {
    return ArticleModel(
      categoryName: categoryName,
      title: json['title'],
      subTitle: json['description'],
      image: json['urlToImage'],
      url: json['url'],
    );
  }
}
