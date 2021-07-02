import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/models/category_model.dart';
import 'package:news_provider/models/news_model.dart';
// En el paquete secrets.dart se encuentra la variable ApiKey
import 'package:news_provider/secrets.dart';

class NewsService with ChangeNotifier {
  static const _BaseUrlNews = 'https://newsapi.org/v2/';

  List<Article> headlines = [];
  final List<Category> categories = [
    Category(FontAwesomeIcons.briefcase, 'business'),
    Category(FontAwesomeIcons.gamepad, 'entertainment'),
    Category(FontAwesomeIcons.newspaper, 'general'),
    Category(FontAwesomeIcons.userMd, 'health'),
    Category(FontAwesomeIcons.flask, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.microchip, 'technology'),
  ];

  late String _selectedCategory;

  Map<String, List<Article>> categoryArticles = {
    'general': [],
  };

  NewsService() {
    _selectedCategory = categories[0].name;
    print('getting headlines');
    getTopHeadlines();
    categories.forEach((element) {
      categoryArticles[element.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;

    getArticlesByCategory(value);
  }

  getTopHeadlines() async {
    final address = '${_BaseUrlNews}top-headlines?country=co&apiKey=$ApiKey';
    final url = Uri.parse(address);

    final response = await http.get(url);

    if (response.statusCode >= 300) return;

    try {
      final NewsResponse newsResponse = newsResponseFromJson(response.body);
      headlines = newsResponse.articles;
      print(headlines);
      notifyListeners();
    } catch (exception) {
      print("Hubo un error:");
      print(exception);
      debugPrint(response.body);
    }
  }

  List<Article> get articlesSelectedCategory =>
      categoryArticles[_selectedCategory]!;

  getArticlesByCategory(String categoryName) async {
    final address = '${_BaseUrlNews}top-headlines?' +
        'country=co&apiKey=$ApiKey&category=$categoryName';
    final url = Uri.parse(address);

    final response = await http.get(url);

    if (response.statusCode >= 300) return;

    try {
      final NewsResponse newsResponse = newsResponseFromJson(response.body);
      categoryArticles[categoryName] = newsResponse.articles;
      print("Recibidas noticias de categoria $categoryName");
      print(newsResponse.articles);
      notifyListeners();
    } catch (exception) {
      print("Hubo un error:");
      print(exception);
      debugPrint(response.body);
    }
  }
}
