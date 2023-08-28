import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

class CustomBottomNavigationBart extends StatefulWidget {
  const CustomBottomNavigationBart({super.key});

  @override
  State<CustomBottomNavigationBart> createState() =>
      _CustomBottomNavigationBartState();
}

class _CustomBottomNavigationBartState
    extends State<CustomBottomNavigationBart> {
  int selectedIndex = 0;
  void onSelectNavItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> bodyPages = const [
    HomePage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: bodyPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        onTap: onSelectNavItem,
      ),
    );
  }
}
