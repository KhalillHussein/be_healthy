import 'package:flutter/material.dart';

class MedkartaTab extends StatelessWidget {
  const MedkartaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.1,
            title: Text(
              'Медкарта',
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
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
