import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController pageController = PageController();
  List<String> pages = ['home', 'about', 'pricing', 'contact', 'location'];
  int _currentIndex = 0;

  void createScrollController(String routeName) {
    pageController = PageController(initialPage: getPageIndex(routeName));
    html.document.title = pages[getPageIndex(routeName)].toUpperCase();

    pageController.addListener(() {
      final pageIndex = (pageController.page ?? 0).round();

      if (pageIndex != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title = pages[pageIndex].toUpperCase();
      }
    });
  }

  int getPageIndex(String routeName) {
    final pageIndex = pages.indexOf(routeName);
    if (pageIndex != -1) {
      return pageIndex;
    }
    return 0;
  }

  void goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
