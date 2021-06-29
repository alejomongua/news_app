import 'package:flutter/material.dart';
import 'package:news_provider/models/navigation_model.dart';
import 'package:news_provider/pages/first_tab_page.dart';
import 'package:news_provider/pages/second_tab_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationModel(),
      child: Scaffold(
        body: _MyPageView(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.paginaActual,
      onTap: (index) => navigationModel.paginaActual = index,
      items: [
        BottomNavigationBarItem(
          label: 'Personalizado',
          icon: Icon(
            Icons.person,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Encabezados',
          icon: Icon(
            Icons.public,
          ),
        )
      ],
    );
  }
}

class _MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationModel navigationModel =
        Provider.of<NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        FirstTabPage(),
        SecondTabPage(),
      ],
    );
  }
}
