import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/chat.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(left: 14.0),
            sliver: SliverAppBar(
              title: Text(
                'Главная',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                      fontSize: 34,
                    ),
              ),
              // pinned: true,
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverToBoxAdapter(
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
