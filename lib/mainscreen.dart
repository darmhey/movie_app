import 'package:flutter/material.dart';
import 'package:movie_app/view/screens/movie_page.dart';
import 'package:movie_app/view/screens/profile.dart';
import 'package:movie_app/view/screens/search.dart';

import 'view/screens/genres.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final pages = [
    const MoviePage(),
    const Genres(),
    const Search(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28,
            ),
            label: "label",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            label: "label",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.keyboard_voice_outlined,
              size: 28,
            ),
            label: "label",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 28,
            ),
            label: "label",
          ),
        ],
      ),
    );
  }
}
