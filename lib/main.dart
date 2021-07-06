import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/router/router.dart';

void main() {
  setPathUrlStrategy();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
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
