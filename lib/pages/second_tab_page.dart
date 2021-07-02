import 'package:flutter/material.dart';
import 'package:news_provider/models/category_model.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class SecondTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              _CategoryList(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: NewsList(news: newsService.articlesSelectedCategory),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final categories = newsService.categories;

    return Container(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          final name =
              '${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}';
          return GestureDetector(
            onTap: () {
              newsService.selectedCategory = category.name;
            },
            child: Container(
              width: 100,
              child: Padding(
                child: Column(
                  children: [
                    _CategoryIcon(category, newsService.selectedCategory),
                    SizedBox(
                      height: 8,
                    ),
                    Text(name),
                  ],
                ),
                padding: EdgeInsets.all(8),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  final Category category;
  final String selectedCategory;

  const _CategoryIcon(this.category, this.selectedCategory);

  @override
  Widget build(BuildContext context) {
    final color =
        selectedCategory == category.name ? Colors.black : Colors.black45;
    final bgColor =
        selectedCategory == category.name ? Colors.white : Colors.white38;
    return Container(
      child: Icon(category.icon, color: color),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
    );
  }
}
