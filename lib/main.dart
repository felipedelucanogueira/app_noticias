import 'package:app_noticias/core/repositories/api_news.dart';
import 'package:app_noticias/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/pages/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: ((context) => HomeBloc(ApiNews())),
        child: const HomeScreen(),
      ),
    ),
  );
}
