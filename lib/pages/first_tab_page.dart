import 'package:flutter/material.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class FirstTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: NewsList(news: newsService.headlines),
    );
  }
}
