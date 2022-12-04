import 'package:flutter/material.dart';
import 'package:marvel/constants/string_constants.dart';
import 'favorites_page.dart';
import 'marvel_listpage2.dart';
import 'mylist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const MarvelListPage2(),
    const MylistPage(),
    FavoritesPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.white12,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: (StringConstants.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add_sharp), label: (StringConstants.myList)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: (StringConstants.favorites)),
        ],
      ),
    );
  }
}
