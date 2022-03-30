import 'package:app_noticias/core/models/article_model.dart';
import 'package:flutter/material.dart';

import '../components/news_card.dart';

class AllNewsScreen extends StatefulWidget {
  final List<ArticleModel> articleList;
  const AllNewsScreen({Key? key, required this.articleList}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 10),
            child: Text(
              'Latest News',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.articleList.length,
              itemBuilder: (context, index) {
                final article = widget.articleList[index];

                return NewsCard(
                  title: article.title,
                  content: article.content,
                  imageUrl: article.urlToImage,
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 30,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
