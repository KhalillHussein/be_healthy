import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/index.dart';
import 'package:medicine_app/util/text.dart';

import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:medicine_app/providers/appoint.dart';
import 'package:medicine_app/ui/views/screens/index.dart';
import 'package:medicine_app/ui/widgets/event_calendar.dart';

import 'package:medicine_app/ui/widgets/map.dart';
import 'package:medicine_app/util/text.dart';
import 'package:provider/provider.dart';

class AppointScreen extends StatelessWidget {
  static const route = '/appoint';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        elevation: 0.0,
        titleSpacing: 0.0,
        leading: IconButton(
            icon: Image.asset('assets/Back.png'),
            onPressed: () {
              Navigator.pop(context);
              Provider.of<AppointProvider>(context, listen: false)
                  .changeStep(Steps.first);
            }),
        title: Text(
          'Запись в клинику',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Color(0xFF0B225A),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (userSnapshot.hasData) {
              return Consumer<AppointProvider>(
                builder: (ctx, appoint, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (appoint.currentStep != Steps.third &&
                        appoint.currentStep != Steps.four)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          appoint.currentStep == Steps.first
                              ? 'Выберите специализацию'
                              : 'Выберите клинику',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xFF0B225A),
                                  fontSize: 20,
                                  letterSpacing: 0.15),
                        ),
                      ),
                    const SizedBox(height: 25),
                    if (appoint.currentStep == Steps.first)
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: specialities.length,
                          itemBuilder: (ctx, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: GestureDetector(
                              onTap: () => appoint.changeStep(Steps.second),
                              child: Text(
                                specialities[index],
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
                          ),
                        ),
                      ),
                    if (appoint.currentStep == Steps.second)
                      Expanded(child: MapWidget()),
                    if (appoint.currentStep == Steps.third)
                      Expanded(child: EventCalendar()),
                    if (appoint.currentStep == Steps.four)
                      Expanded(child: Checkout()),
                  ],
                ),
              );
            }
            Future.delayed(Duration(milliseconds: 400)).then((value) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) => AlertDialog(
                  buttonPadding: EdgeInsets.symmetric(horizontal: 25),
                  backgroundColor: Theme.of(context).appBarTheme.color,
                  title: Text(
                    'Упс..',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  content: Text(
                    'Авторизуйтесь, чтобы воспользоваться данным функционалом',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  actions: <Widget>[
                    GradientButton(
                      elevation: 0,
                      increaseHeightBy: 4,
                      shapeRadius: BorderRadius.all(Radius.circular(12.0)),
                      increaseWidthBy: double.infinity,
                      shadowColor: Colors.transparent,
                      child: const Text('Продолжить'),
                      callback: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.route);
                      },
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF7D98FB),
                          Color(0xFFB5C4FD),
                        ],
                        stops: [0.1, 1],
                      ),
                    ),
                  ],
                ),
              );
            });

            return Consumer<AppointProvider>(
              builder: (ctx, appoint, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (appoint.currentStep != Steps.third &&
                      appoint.currentStep != Steps.four)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        appoint.currentStep == Steps.first
                            ? 'Выберите специализацию'
                            : 'Выберите клинику',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Color(0xFF0B225A),
                            fontSize: 20,
                            letterSpacing: 0.15),
                      ),
                    ),
                  const SizedBox(height: 25),
                  if (appoint.currentStep == Steps.first)
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: specialities.length,
                        itemBuilder: (ctx, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: GestureDetector(
                            onTap: () => appoint.changeStep(Steps.second),
                            child: Text(
                              specialities[index],
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
                        ),
                      ),
                    ),
                  if (appoint.currentStep == Steps.second)
                    Expanded(child: MapWidget()),
                  if (appoint.currentStep == Steps.third)
                    Expanded(child: EventCalendar()),
                  if (appoint.currentStep == Steps.four)
                    Expanded(child: Checkout()),
                ],
              ),
            );
          }),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF4F5FC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Пациент',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: Color(0xFF5C698B),
                  ),
                ),
                Text(
                  'Иванов Иван Иваныч',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: Color(0xFF0B225A),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Услуга',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: Color(0xFF5C698B),
                  ),
                ),
                Text(
                  'Прием в клинике',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: Color(0xFF0B225A),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Специализация',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: Color(0xFF5C698B),
                  ),
                ),
                Text(
                  'Невролог',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: Color(0xFF0B225A),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Врач',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: Color(0xFF5C698B),
                  ),
                ),
                Text(
                  'Грушевская Наталья Михайловна',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: Color(0xFF0B225A),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Дата и время',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: Color(0xFF5C698B),
                  ),
                ),
                Text(
                  '23 июня 12:00',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: Color(0xFF0B225A),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Клиника',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: Color(0xFF5C698B),
                  ),
                ),
                Text(
                  'Клиника ЭкоФарм в Ростове-на-Дону Ростовская область, пер. Газетный, д 133',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: Color(0xFF0B225A),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF4F5FC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Стоимость',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: Color(0xFF5C698B),
                      ),
                    ),
                    Text(
                      '2500 р',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 0.25,
                        color: Color(0xFF0B225A),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                GradientButton(
                  elevation: 0,
                  increaseHeightBy: 2,
                  shapeRadius: BorderRadius.all(Radius.circular(12.0)),
                  increaseWidthBy: double.infinity,
                  shadowColor: Colors.transparent,
                  child: Text('Отправить заявку'),
                  callback: () {
                    Navigator.pop(context);
                    Provider.of<AppointProvider>(context, listen: false)
                        .changeStep(Steps.first);
                  },
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF7D98FB),
                      Color(0xFFB5C4FD),
                    ],
                    stops: [0.1, 1],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
