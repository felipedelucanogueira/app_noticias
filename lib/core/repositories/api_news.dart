import 'dart:convert';

import 'package:app_noticias/core/models/article_model.dart';
import 'package:http/http.dart' as http;

enum Coin { BRL, USD, GBL }

class ApiNews {
  final _path =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=23c30098b82a42828f2036b9fe9e0ec3';

  Future<List<ArticleModel>> getNews() async {
    final response = await http.get(Uri.parse(_path));

    try {
      if (response.statusCode == 200) {
        final decodeJson = jsonDecode(response.body);

        final articlesList = decodeJson['articles'] as List;
        return articlesList
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      }
      return [];
    } catch (error) {
      throw Exception(error);
    }
  }
}
