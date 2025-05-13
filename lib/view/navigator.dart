import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/utils/constants.dart';
import 'package:sneaker_app/view/bag/bag_view.dart';
import 'package:sneaker_app/view/user_profile/user_profile_view.dart';
import 'package:sneaker_app/view/view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Widget> _screens = [
    HomeView(),
    BagView(),
    UserProfileView(),
    Container(
      color: Colors.pink,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(_selectedIndex,
        curve: Curves.linear, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 27.0,
          bubbleCurve: Curves.linear,
          selectedColor: AppConstantsColor.materialButtonColor,
          strokeColor: AppConstantsColor.materialButtonColor,
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Colors.white,
          scaleFactor: 0.1,
          items: [
            CustomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
            ),
            CustomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
            ),
            CustomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
            ),
          ]),
    );
  }
}
