import 'package:flutter/material.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:provider/provider.dart';

class SecondTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [_CategoryList()],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: [
              Icon(categories[index].icon),
              SizedBox(height: 5),
              Text(categories[index].name),
            ],
          ),
          padding: EdgeInsets.all(8),
        );
      },
    );
  }
}
