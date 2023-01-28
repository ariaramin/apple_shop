import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/authentication/presentation/presenter/profile_screen.dart';
import 'package:apple_shop/feature/cart/presentation/cart_screen.dart';
import 'package:apple_shop/feature/category/presentation/bloc/category_bloc.dart';
import 'package:apple_shop/feature/category/presentation/category_screen.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_bloc.dart';
import 'package:apple_shop/feature/home/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
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
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
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
      const ProfileScreen(),
      const CartScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
    ];
  }
}
