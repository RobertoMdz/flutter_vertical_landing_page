import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController pageController = PageController();

  goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
