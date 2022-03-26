import 'package:app_noticias/core/models/source_model.dart';

class ArticleModel {
  final String title;
  final String author;
  final String content;
  final String urlToImage;
  final String description;
  final SourceModel source;

  ArticleModel({
    required this.title,
    required this.author,
    required this.content,
    required this.urlToImage,
    required this.description,
    required this.source,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      description: json['description'] ?? '',
      source: SourceModel.fromJson(json['source']),
    );
  }

  @override
  String toString() {
    return 'ArticleModel(title: $title, author: $author, content: $content, urlToImage: $urlToImage, description: $description, source: $source)';
  }
}
