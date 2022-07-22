import 'package:flutter/material.dart';
import 'package:flutter_tutorial/travel_app/misc/colors.dart';
import 'package:flutter_tutorial/travel_app/pages/nav_pages/home_page.dart';
import 'package:flutter_tutorial/travel_app/pages/nav_pages/popular_page.dart';
import 'package:flutter_tutorial/travel_app/pages/nav_pages/profile_page.dart';
import 'package:flutter_tutorial/travel_app/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {

   const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pages=[const HomePage(), const PopularPage(), const SearchPage(), const ProfilePage()];
  var currentIndex=0;
  void onTap(int value) {
    setState(() {
      currentIndex= value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black54,
        unselectedItemColor: AppColors.mainTextColor.withOpacity(0.5),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Popular"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }


}
