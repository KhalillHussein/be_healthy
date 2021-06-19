import 'package:flutter/material.dart';
import 'package:medicine_app/util/text.dart';

class AppointScreen extends StatelessWidget {
  const AppointScreen({Key? key}) : super(key: key);

  static const route = '/appoint';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Image.asset('assets/Back.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Запись в клинику',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Color(0xFF0B225A),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Выберите специализацию',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Color(0xFF0B225A), fontSize: 20, letterSpacing: 0.15),
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              itemCount: specialities.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  specialities[index],
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xFF5C698B),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
