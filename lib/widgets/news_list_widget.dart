import 'package:flutter/material.dart';
import 'package:news_provider/models/news_model.dart';
import 'package:news_provider/widgets/article_widget.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return ArticleView(article: news[index]);
      },
    );
  }
}
