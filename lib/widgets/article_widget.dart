import 'package:flutter/material.dart';

import 'package:news_provider/models/news_model.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: article.urlToImage == null
              ? Container()
              : Image(
                  image: NetworkImage(article.urlToImage!),
                ),
        ),
        Text(article.title),
      ],
    );
  }
}
