import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.badgeLabel,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.colors,
  }) : super(key: key);

  final String badgeLabel;
  final String title;
  final String subtitle;
  final String trailing;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFF4F5FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: colors,
                      stops: const [0.1, 1.2],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Text(
                  badgeLabel,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Text(
                trailing,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Color(0xFF5C698B),
                      fontWeight: FontWeight.w400,
                    ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset('assets/Profile.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xFF5C698B),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.25),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xFF5C698B),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
