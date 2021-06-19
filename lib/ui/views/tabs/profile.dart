import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/error.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int? _value = 0;

  final List<String> _categories = [
    'Все',
    'Консультации',
    'Анализы',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            automaticallyImplyLeading: false,
            // toolbarHeight: 86,
            expandedHeight: MediaQuery.of(context).size.height * 0.1,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 15, bottom: 10),
              centerTitle: false,
              title: Text(
                'Профиль',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Color(0xFF0B225A),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                      fontSize: 22,
                    ),
              ),
            ),

            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/Notify.png'),
                padding: EdgeInsets.all(15),
                splashRadius: 20,
              )
            ],
            // pinned: true,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverToBoxAdapter(
              child: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (ctx, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!userSnapshot.hasData) {
                      return ErrorScreen();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildUserHeader(),
                          const SizedBox(height: 25),
                          Wrap(
                            runSpacing: 6,
                            children: [
                              Text(
                                'Хронические заболевания:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Color(0xFF5C698B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              _buildBadge('Миопия'),
                              _buildBadge('Ревматоидный артрит'),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Wrap(
                            runSpacing: 6,
                            children: [
                              Text(
                                'Принимаемые лекарства:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Color(0xFF5C698B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              _buildBadge('Мезим'),
                              _buildBadge('Супрастин'),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Text(
                                'Вес:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Color(0xFF5C698B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              _buildBadge('81.1 кг'),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Text(
                                'Рост:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Color(0xFF5C698B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              _buildBadge('189 см'),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Редактировать',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xFF5C698B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Поддержка',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xFF5C698B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: FirebaseAuth.instance.signOut,
                            child: Text(
                              'Выход',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Color(0xFF5C698B),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Версия 0.0.1 beta',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Color(0xFF5C698B),
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.4,
                                        fontSize: 12,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13),
          child: CircleAvatar(
            radius: 20,
            child: Image.asset('assets/Profile.png'),
            backgroundColor: Color(0xFFF4F5FC),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Иванов Иван',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0xFF0B225A),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                'мужчина, 19 лет',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Color(0xFF5C698B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFFB499FF),
              Color(0xFFDACCFF),
            ],
            stops: const [0.1, 1.2],
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Text(
        label,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
