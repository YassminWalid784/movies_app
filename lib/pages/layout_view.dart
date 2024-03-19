import 'package:flutter/material.dart';
import 'package:movies_app/pages/browse/pages/browse_view.dart';
import 'package:movies_app/pages/home/pages/home_view.dart';
import 'package:movies_app/pages/search/pages/search_view.dart';
import 'package:movies_app/pages/watchList/pages/watchlist_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const BrowseView(),
    const WatchListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "SEARCH",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'WATCHLIST',
          ),
        ],
      ),
    );
  }
}

