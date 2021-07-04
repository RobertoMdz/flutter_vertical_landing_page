import 'package:flutter/material.dart';
import 'package:vertical_landing_page/router/router.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      initialRoute: '/home',
      onGenerateRoute: (routeSettings) =>
          Flurorouter.router.generator(routeSettings),
    );
  }
}
