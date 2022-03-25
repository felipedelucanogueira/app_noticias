import 'package:flutter/material.dart';

import 'core/repositories/api_news.dart';
import 'features/home_screen/home_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));

  final api = ApiNews();

  api.getNews();
}
