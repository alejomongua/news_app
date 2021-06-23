import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/models/news_model.dart';
// En el paquete secrets.dart se encuentra la variable ApiKey
import 'package:news_provider/secrets.dart';

class NewsService with ChangeNotifier {
  static const _BaseUrlNews = 'https://newsapi.org/v2/';

  List<Article> headlines = [];

  NewsService() {
    print('getting headlines');
    getTopHeadlines();
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
}
