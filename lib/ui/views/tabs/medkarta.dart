import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/error.dart';
import 'package:medicine_app/ui/widgets/history_card.dart';
import 'package:medicine_app/util/text.dart';

class MedkartaTab extends StatefulWidget {
  const MedkartaTab({Key? key}) : super(key: key);

  @override
  _MedkartaTabState createState() => _MedkartaTabState();
}

class _MedkartaTabState extends State<MedkartaTab> {
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
                'Медкарта',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('История посещений',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Color(0xFF0B225A),
                                          fontSize: 20,
                                          letterSpacing: 0.15)),
                              Icon(
                                Icons.add,
                                size: 25,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Wrap(spacing: 12, children: [
                            for (int index = 0;
                                index < _categories.length;
                                index++)
                              ChoiceChip(
                                label: Text(_categories[index]),
                                selectedColor: Color(0xFFD9DCF2),
                                backgroundColor: Color(0xFFF4F5FC),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: Color(0xFF5C698B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                selected: _value == index,
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = selected ? index : null;
                                  });
                                },
                              ),
                          ]),
                          if (_value == 0)
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: medkartaHistory.length,
                                itemBuilder: (ctx, index) {
                                  switch (medkartaHistory[index]['location']) {
                                    case 'В клинике':
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFF39B4F9),
                                          Color(0xFFB4E3FE),
                                        ],
                                        badgeLabel: medkartaHistory[index]
                                            ['location'],
                                        title: medkartaHistory[index]['name'],
                                        subtitle: medkartaHistory[index]
                                            ['speciality'],
                                        trailing: medkartaHistory[index]
                                            ['date'],
                                      );
                                    case 'На дому':
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFF7D98FB),
                                          Color(0xFFB5C4FD),
                                        ],
                                        badgeLabel: medkartaHistory[index]
                                            ['location'],
                                        title: medkartaHistory[index]['name'],
                                        subtitle: medkartaHistory[index]
                                            ['speciality'],
                                        trailing: medkartaHistory[index]
                                            ['date'],
                                      );
                                    case 'Анализы':
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFFFF99A5),
                                          Color(0xFFFFCCD2),
                                        ],
                                        badgeLabel: medkartaHistory[index]
                                            ['location'],
                                        title: medkartaHistory[index]['name'],
                                        subtitle: medkartaHistory[index]
                                            ['speciality'],
                                        trailing: medkartaHistory[index]
                                            ['date'],
                                      );
                                    default:
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFF7D98FB),
                                          Color(0xFFB5C4FD),
                                        ],
                                        badgeLabel: medkartaHistory[index]
                                            ['location'],
                                        title: medkartaHistory[index]['name'],
                                        subtitle: medkartaHistory[index]
                                            ['speciality'],
                                        trailing: medkartaHistory[index]
                                            ['date'],
                                      );
                                  }
                                }),
                          if (_value == 1)
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: medkartKonsultation.length,
                                itemBuilder: (ctx, index) {
                                  switch (medkartKonsultation[index]
                                      ['location']) {
                                    case 'В клинике':
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFF39B4F9),
                                          Color(0xFFB4E3FE),
                                        ],
                                        badgeLabel: medkartKonsultation[index]
                                            ['location'],
                                        title: medkartKonsultation[index]
                                            ['name'],
                                        subtitle: medkartKonsultation[index]
                                            ['speciality'],
                                        trailing: medkartKonsultation[index]
                                            ['date'],
                                      );
                                    case 'На дому':
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFF7D98FB),
                                          Color(0xFFB5C4FD),
                                        ],
                                        badgeLabel: medkartKonsultation[index]
                                            ['location'],
                                        title: medkartKonsultation[index]
                                            ['name'],
                                        subtitle: medkartKonsultation[index]
                                            ['speciality'],
                                        trailing: medkartKonsultation[index]
                                            ['date'],
                                      );
                                    default:
                                      return HistoryCard(
                                        colors: const [
                                          Color(0xFF7D98FB),
                                          Color(0xFFB5C4FD),
                                        ],
                                        badgeLabel: medkartKonsultation[index]
                                            ['location'],
                                        title: medkartKonsultation[index]
                                            ['name'],
                                        subtitle: medkartKonsultation[index]
                                            ['speciality'],
                                        trailing: medkartKonsultation[index]
                                            ['date'],
                                      );
                                  }
                                }),
                          if (_value == 2)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: medkartaAnaliz.length,
                              itemBuilder: (ctx, index) => HistoryCard(
                                colors: const [
                                  Color(0xFFFF99A5),
                                  Color(0xFFFFCCD2),
                                ],
                                badgeLabel: medkartaAnaliz[index]['location'],
                                title: medkartaAnaliz[index]['name'],
                                subtitle: medkartaAnaliz[index]['speciality'],
                                trailing: medkartaAnaliz[index]['date'],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
