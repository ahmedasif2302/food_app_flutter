import 'package:flutter/material.dart';
import 'package:food_app/common/utils/colors.dart';

class BottomTabNavigator extends StatefulWidget {
  final dynamic navigationShell;
  const BottomTabNavigator({super.key, required this.navigationShell});

  @override
  State<BottomTabNavigator> createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.fontColor,
      currentIndex: widget.navigationShell.currentIndex,
      onTap: _goBranch,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        )
      ],
    );
  }
}

//  onTap: (index) {
//         setState(() {
//           _selectedIndex = index;
//         });
//         if (index == 0) {
//           GoRouter.of(context).go('/home');
//         } else if (index == 1) {
//           GoRouter.of(context).go('/shop');
//         } else if (index == 2) {
//           GoRouter.of(context).go('/cart');
//         } else if (index == 3) {
//           GoRouter.of(context).go('/favourite');
//         } else if (index == 4) {
//           GoRouter.of(context).go('/profile');
//         }
//       }
