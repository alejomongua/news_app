import 'package:flutter/material.dart';
import 'package:news_provider/models/news_model.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        final article = news[index];
        return ListTile(
          title: Text(article.title),
          // leading: Text(article.description),
          onTap: () => print(article.description),
        );
      },
    );
  }
}
