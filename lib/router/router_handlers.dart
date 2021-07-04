import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

import '../ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final pageRoute = params['page']!.first;
    if (pageRoute != '/') {
      final pageProvider = Provider.of<PageProvider>(context!, listen: false);
      pageProvider.createScrollController(pageRoute);
      return HomePage();
    }
  },
);
