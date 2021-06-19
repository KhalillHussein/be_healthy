import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../providers/navigation.dart';
import '../tabs/index.dart';

class StartScreen extends StatelessWidget {
  static const route = '/start';

  final List<Widget> _tabs = [
    HomeTab(),
    MedkartaTab(),
    Center(child: Text('Account')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody() {
    return Consumer<NavigationProvider>(
      builder: (ctx, tabData, _) => _tabs[tabData.currentIndex],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (ctx, tabsData, _) => BottomNavigationBar(
        onTap: (index) => tabsData.currentIndex = index,
        currentIndex: tabsData.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Home.png',
              width: 24,
              height: 24,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/MedCard.png',
              width: 24,
              height: 24,
            ),
            label: 'Медкарта',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Profile.png',
              width: 24,
              height: 24,
            ),
            label: 'Аккаунт',
          ),
        ],
      ),
    );
  }
}
