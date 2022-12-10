import 'package:apple_shop/constants/app_colors.dart';
import 'package:apple_shop/ui/screens/category_screen.dart';
import 'package:apple_shop/ui/screens/home_screen.dart';
import 'package:apple_shop/ui/screens/product_list_screen.dart';
import 'package:apple_shop/ui/screens/product_screen.dart';
import 'package:apple_shop/ui/screens/profile_screen.dart';
import 'package:apple_shop/ui/screens/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedItem,
        children: _getScreens(),
      ),
      bottomNavigationBar: _getBottomNavigation(),
    );
  }

  Widget _getBottomNavigation() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _selectedItem = value;
        });
      },
      currentIndex: _selectedItem,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        fontFamily: "SM",
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: "SM",
        fontSize: 12,
      ),
      items: [
        _getBottomNavigationItem(
          SvgPicture.asset("assets/icons/user.svg"),
          SvgPicture.asset("assets/icons/user-filled.svg"),
          "حساب کاربری",
        ),
        _getBottomNavigationItem(
          SvgPicture.asset("assets/icons/bag.svg"),
          SvgPicture.asset("assets/icons/bag-filled.svg"),
          "سبد خرید",
        ),
        _getBottomNavigationItem(
          SvgPicture.asset("assets/icons/category.svg"),
          SvgPicture.asset("assets/icons/category-filled.svg"),
          "دسته بندی",
        ),
        _getBottomNavigationItem(
          SvgPicture.asset("assets/icons/home.svg"),
          SvgPicture.asset("assets/icons/home-filled.svg"),
          "خانه",
        ),
      ],
    );
  }

  BottomNavigationBarItem _getBottomNavigationItem(
    Widget icon,
    Widget activeIcon,
    String title,
  ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: icon,
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: activeIcon,
      ),
      label: title,
    );
  }

  List<Widget> _getScreens() {
    return [
      ProfileScreen(),
      SplashScreen(),
      CategoryScreen(),
      HomeScreen(),
    ];
  }
}
