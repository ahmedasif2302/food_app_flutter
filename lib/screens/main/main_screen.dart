import 'package:flutter/material.dart';
import 'package:food_app/common/widgets/header.dart';
import 'package:food_app/screens/cart/cart.dart';
import 'package:food_app/screens/favorites/favorites.dart';
import 'package:food_app/screens/home/home.dart';
import 'package:food_app/screens/profile/profile.dart';
import 'package:food_app/screens/shop/Shop.dart';

final List<Map<dynamic, dynamic>> pages = [
  {
    'title': 'Home',
    'widget': const Home(),
  },
  {
    'title': 'Shop',
    'widget': const Shop(),
  },
  {
    'title': 'Cart',
    'widget': const Cart(),
  },
  {
    'title': 'Favorites',
    'widget': const Favorites(),
  },
  {
    'title': 'Profile',
    'widget': const Profile(),
  },
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Header(
      title: pages[currentIndex].title.toString(),
      child: pages[currentIndex].widget,
    );
  }
}
