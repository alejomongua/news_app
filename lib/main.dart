import 'package:flutter/material.dart';
import 'package:news_provider/pages/tabs_page.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/theme/main_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        theme: mainTheme,
        home: TabsPage(),
      ),
    );
  }
}
