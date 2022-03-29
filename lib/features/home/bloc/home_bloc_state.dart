import 'package:app_noticias/core/models/article_model.dart';

abstract class HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoading extends HomeBlocState {}

class HomeBlocSuccess extends HomeBlocState {
  final List<ArticleModel> articleList;
  HomeBlocSuccess(this.articleList);
}

class HomeBlocError extends HomeBlocState {}
