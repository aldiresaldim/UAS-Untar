import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marvel/controller/mylist_controller.dart';
import 'package:marvel/data/models/marvel_models.dart';
import 'package:marvel/utils/routes.dart';
import 'package:marvel/views/details_page.dart';
import 'package:marvel/views/favorites_page.dart';
import 'package:marvel/views/home_page.dart';
import 'package:marvel/views/marvel_listpage2.dart';
import 'package:marvel/views/mylist_page.dart';
import 'package:marvel/views/splash_screen_page.dart';
import 'package:provider/provider.dart';
import 'controller/favourites_controller.dart';
import 'controller/marvel_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MarvelController()),
        ChangeNotifierProvider(create: (context) => Favorites()),
        ChangeNotifierProvider(create: (context) => MyListController()),
        ChangeNotifierProvider(create: (context) => Data()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: 'Splash',
        routes: {
          Routes.splashScreen:(context)=> const Splash(),
          Routes.HOME: (context) => const HomePage(),
          Routes.detailsPage: (context) => DetailsPage(),
          Routes.marvelListPage2: (context) => const MarvelListPage2(),
          Routes.favorites: (context) => FavoritesPage(),
          Routes.myListPage: (context) => const MylistPage(),
        },
      ),
    );
  }
}
