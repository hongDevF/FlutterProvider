// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterprovider/views/screens/all_screen.dart';
import 'package:flutterprovider/views/screens/card/super_card.dart';

import 'package:flutterprovider/views/widgets/global/colors.dart';

import '../product_screen.dart';
import '../setting/setting_screen.dart';
import 'home_screen.dart';

class onBoardScreen extends StatefulWidget {
  const onBoardScreen({super.key});

  @override
  State<onBoardScreen> createState() => _onBoardScreenState();
}

class _onBoardScreenState extends State<onBoardScreen> {
  int _selectedPage = 0;
  onSelected(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List _pages = [
    HomeScreen(),
    SuperCard(),
    ProductScreen(),
    AllScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        // type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPage,
        selectedItemColor: CO_BLUE,
        unselectedItemColor: Colors.grey,
        onTap: onSelected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard_outlined,
              size: 30,
            ),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            ),
            label: 'shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inclusive,
              size: 30,
            ),
            label: 'all',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: 'setting',
          ),
        ],
      ),
    );
  }
}
