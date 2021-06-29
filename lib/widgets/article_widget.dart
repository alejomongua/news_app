import 'package:flutter/material.dart';

import 'package:news_provider/models/news_model.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({required this.article});

  @override
  Widget build(BuildContext context) {
    final _title = Text(
      article.title,
      style: TextStyle(
        fontSize: 18,
      ),
    );

    final _content = Text(
      article.description,
      style: TextStyle(
        fontSize: 14,
      ),
    );

    return InkWell(
      onTap: () => print(article),
      child: Column(
        children: <Widget>[
          _title,
          _Image(article),
          _content,
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final Article article;

  _Image(this.article);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: (article.urlToImage == null ? _noImage() : _networkImage()),
      ),
    );
  }

  _networkImage() {
    // Reemplace el protocolo, porque las imágenes http no funcionan
    final String url = article.urlToImage!.replaceAll('http://', 'https://');

    try {
      return FadeInImage.assetNetwork(
        placeholder: 'assets/giphy.gif',
        image: url,
      );
    } catch (e) {
      return _noImage();
    }
  }

  _noImage() => Image(
        image: AssetImage('assets/no-image.png'),
      );
}
