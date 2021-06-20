import 'package:flutter/foundation.dart';
import 'package:medicine_app/models/vrach.dart';

import 'package:table_calendar/table_calendar.dart';

class TableCalendarProvider with ChangeNotifier {
  List<Vrach>? selectedEvents;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  final List<Vrach> timetableList = [
    Vrach(
      0,
      'Алексеев Евгений Петрович',
      'Невролог',
      '2500 ₽',
      'Клиника ЭкоФарм',
      ['12:00', '15:00', '18:00'],
      DateTime.now().add(
        Duration(days: 2),
      ),
    ),
    Vrach(
      1,
      'Микеенко Афанасий Игоревич',
      'Дерматолог',
      '2800 ₽',
      'Клиника ЭкоФарм',
      ['10:00', '14:00', '13:00'],
      DateTime.now().add(
        Duration(days: 2),
      ),
    ),
    Vrach(
      2,
      'Ефремов Андрей Петрович',
      'Дерматолог',
      '2700 ₽',
      'Клиника ЭкоФарм',
      ['12:00', '18:00'],
      DateTime.now().add(
        Duration(days: 2),
      ),
    ),
    Vrach(
      3,
      'Ефремов Андрей Петрович',
      'Дерматолог',
      '2700 ₽',
      'Клиника ЭкоФарм',
      ['12:00', '18:00'],
      DateTime.now().add(
        Duration(days: 3),
      ),
    ),
    Vrach(
      4,
      'Ефремов Андрей Петрович',
      'Дерматолог',
      '2700 ₽',
      'Клиника ЭкоФарм',
      ['12:00', '18:00'],
      DateTime.now().add(
        Duration(days: 4),
      ),
    ),
    Vrach(
      5,
      'Ефремов Андрей Петрович',
      'Дерматолог',
      '2700 ₽',
      'Клиника ЭкоФарм',
      ['12:00', '18:00'],
      DateTime.now().add(
        Duration(days: 4),
      ),
    ),
    Vrach(
      6,
      'Ефремов Андрей Петрович',
      'Дерматолог',
      '2700 ₽',
      'Клиника ЭкоФарм',
      ['12:00', '18:00'],
      DateTime.now().add(
        Duration(days: 5),
      ),
    ),
  ];

  TableCalendarProvider() {
    selectedDay = focusedDay;
    selectedEvents = getEventsForDay(selectedDay!);
  }

  List<Vrach> getEventsForDay(DateTime day) {
    return [
      for (final item in timetableList)
        if (item.date.isSameDate(day)) item
    ];
  }

  void onDaySelected(DateTime selDay, DateTime focDay) {
    if (!isSameDay(selectedDay, selDay)) {
      selectedDay = selDay;
      focusedDay = focDay;
      selectedEvents = getEventsForDay(selDay);
      notifyListeners();
    }
  }

  void onPageChanged(DateTime focDay) {
    focusedDay = focDay;
    selectedDay = focDay;
    selectedEvents = getEventsForDay(focDay);
    notifyListeners();
  }

  Future<void> setCalendarFormat() async {
    calendarFormat == CalendarFormat.month
        ? calendarFormat = CalendarFormat.week
        : calendarFormat = CalendarFormat.month;
    notifyListeners();
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
