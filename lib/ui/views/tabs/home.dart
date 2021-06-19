import 'package:flutter/material.dart';

import '../screens/index.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 86,
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.1,
            title: Text(
              'Главная',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Color(0xFF0B225A),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.25,
                    fontSize: 34,
                  ),
            ),
            // pinned: true,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    TextButton(
                      child: Text('Чат'),
                      onPressed: () =>
                          Navigator.pushNamed(context, ChatScreen.route),
                    ),
                    TextButton(
                      child: Text('Запись'),
                      onPressed: () =>
                          Navigator.pushNamed(context, AppointScreen.route),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
