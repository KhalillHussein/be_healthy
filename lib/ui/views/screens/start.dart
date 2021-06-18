import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../providers/navigation.dart';
import '../tabs/home.dart';

class StartScreen extends StatelessWidget {
  static const route = '/start';

  final List<Widget> _tabs = [
    HomeTab(),
    Center(child: Text('Book')),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Домой',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
              size: 30,
            ),
            label: 'Медкарта',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Аккаунт',
          ),
        ],
      ),
    );
  }
}
