import 'package:flutter/material.dart';

class NavigationModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;

    _pageController.animateToPage(
      valor,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
