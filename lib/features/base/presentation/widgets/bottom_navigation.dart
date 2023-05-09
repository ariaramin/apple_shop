import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int)? onTap;
  final int selectedItem;

  const BottomNavigation({
    super.key,
    required this.selectedItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedItem,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: [
        _getBottomNavigationItem(
          SvgPicture.asset(
            "assets/icons/home.svg",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          SvgPicture.asset("assets/icons/home-filled.svg"),
          "خانه",
        ),
        _getBottomNavigationItem(
          SvgPicture.asset(
            "assets/icons/category.svg",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          SvgPicture.asset("assets/icons/category-filled.svg"),
          "دسته بندی",
        ),
        _getBottomNavigationItem(
          SvgPicture.asset(
            "assets/icons/bag.svg",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          SvgPicture.asset("assets/icons/bag-filled.svg"),
          "سبد خرید",
        ),
        _getBottomNavigationItem(
          SvgPicture.asset(
            "assets/icons/user.svg",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          SvgPicture.asset("assets/icons/user-filled.svg"),
          "حساب کاربری",
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
}
