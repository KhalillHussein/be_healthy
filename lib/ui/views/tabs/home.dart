import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/chat.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: const Text('Главная'),
            pinned: true,
          ),
          // _SliverBar(
          //   height: 0.11,
          //   header: Text(
          //     'Главная',
          //     style:
          //         TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.25),
          //   ),
          // ),
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

class _SliverBar extends StatelessWidget {
  static const double heightRatio = 0.31;

  final Widget? header;
  final num height;
  final List<Widget>? actions;

  const _SliverBar({
    this.header,
    this.height = heightRatio,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0.0,
      expandedHeight: MediaQuery.of(context).size.height * height,
      automaticallyImplyLeading: false,
      actions: actions,

      // pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: header,
      ),
    );
  }
}
