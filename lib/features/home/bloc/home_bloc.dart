import 'dart:io';

import 'package:app_noticias/core/models/article_model.dart';
import 'package:app_noticias/core/repositories/api_news.dart';
import 'package:app_noticias/features/home/bloc/home_bloc_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Cubit<HomeBlocState> {
  final ApiNews repository;
  HomeBloc(this.repository) : super(HomeBlocInitial());

  Future<void> getNews() async {
    try {
      emit(HomeBlocLoading());
      final articleList = await repository.getNews();

      emit(HomeBlocSuccess(articleList));
    } catch (e) {
      emit(HomeBlocError());
    }
  }
}
