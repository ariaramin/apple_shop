import 'package:apple_shop/features/authentication/presentation/presenter/profile_screen.dart';
import 'package:apple_shop/features/base/presentation/widgets/bottom_navigation.dart';
import 'package:apple_shop/features/cart/presentation/cart_screen.dart';
import 'package:apple_shop/features/category/presentation/category_screen.dart';
import 'package:apple_shop/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedItem,
        children: _getScreens(),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedItem: _selectedItem,
        onTap: (value) {
          setState(() {
            _selectedItem = value;
          });
        },
      ),
    );
  }

  List<Widget> _getScreens() {
    return [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }
}
