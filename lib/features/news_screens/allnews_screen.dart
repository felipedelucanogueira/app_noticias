import 'package:flutter/material.dart';

import '../components/news_card.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

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
              itemBuilder: (context, index) {
                return NewsCard(
                  title: 'Nubank teste titulo flutter',
                  content: 'texto de Conteudo teste ',
                  imageUrl: 'https://source.unsplash.com/random',
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 30,
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
