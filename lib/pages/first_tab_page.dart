import 'package:flutter/material.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class FirstTabPage extends StatefulWidget {
  @override
  _FirstTabPageState createState() => _FirstTabPageState();
}

class _FirstTabPageState extends State<FirstTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final NewsService newsService = Provider.of<NewsService>(context);

    final newsList = Container(
      padding: EdgeInsets.all(20),
      child: NewsList(news: newsService.headlines),
    );

    final loading = Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      body: newsService.headlines.length == 0 ? loading : newsList,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
