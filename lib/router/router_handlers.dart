import 'package:fluro/fluro.dart';

import '../ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  return HomePage();
});