import 'package:flutter/material.dart';
import 'package:news_provider/models/category_model.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:provider/provider.dart';

class SecondTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              _CategoryList(),
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
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final name =
              '${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}';
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 100,
              child: Padding(
                child: Column(
                  children: [
                    _CategoryIcon(categories[index]),
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

  const _CategoryIcon(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(category.icon, color: Colors.black87),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white70,
      ),
    );
  }
}
