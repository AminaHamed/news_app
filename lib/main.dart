import 'package:flutter/material.dart';
import 'package:news_app/core/theme/my_theme.dart';
import 'package:news_app/view/details_screen/details_screen.dart';
import 'package:news_app/view/home_view/home_view.dart';

import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeView.routeName:(_)=>HomeView(),
        NewsDetailsScreen.routName:(_)=> NewsDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

