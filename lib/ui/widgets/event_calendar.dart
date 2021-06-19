import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_app/models/vrach.dart';
import 'package:medicine_app/providers/appoint.dart';
import 'package:medicine_app/providers/calendar.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalendar extends StatelessWidget {
  const EventCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTableCalendar(context);
  }

  Widget _buildTableCalendar(BuildContext context) {
    return Consumer<TableCalendarProvider>(
      builder: (ctx, calendar, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFF4F5FC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TableCalendar(
                locale: 'ru_RU',
                availableCalendarFormats: const {
                  CalendarFormat.month: '',
                  CalendarFormat.week: '',
                },
                selectedDayPredicate: (day) =>
                    isSameDay(calendar.selectedDay, day),
                eventLoader: (day) => calendar.getEventsForDay(day),
                calendarFormat: calendar.calendarFormat,
                onDaySelected: calendar.onDaySelected,
                onPageChanged: calendar.onPageChanged,
                focusedDay: calendar.focusedDay,
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: _singleMarkerBuilder,
                  selectedBuilder: _selectedBuilder,
                  headerTitleBuilder: (ctx, date) => Text(
                    toBeginningOfSentenceCase(
                      DateFormat.MMMM('Ru').format(date),
                    )!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF0B225A),
                        ),
                  ),
                ),
                firstDay: DateTime.now().subtract(Duration(days: 30)),
                lastDay: DateTime.now().add(Duration(days: 30)),
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                itemCount: calendar.selectedEvents!.length,
                itemBuilder: (ctx, index) => VrachCard(
                  title: calendar.selectedEvents![index].name,
                  subtitle: calendar.selectedEvents![index].speciality,
                  trailing: calendar.selectedEvents![index].price,
                  bottomTitle: calendar.selectedEvents![index].clinika,
                  badgeTitles: calendar.selectedEvents![index].hours,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _singleMarkerBuilder(BuildContext ctx, DateTime day, Vrach element) {
    return Container(
      margin: const EdgeInsets.all(1.3),
      decoration: BoxDecoration(
        color: Color(0xFF7D98FB),
        shape: BoxShape.circle,
      ),
      width: 4,
      height: 4,
    );
  }

  Widget _selectedBuilder(BuildContext ctx, DateTime date, DateTime _) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(ctx).accentColor.withOpacity(0.4)),
        child: Text(
          '${date.day}',
          textScaleFactor: 1.13,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class VrachCard extends StatelessWidget {
  const VrachCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.bottomTitle,
    required this.trailing,
    required this.badgeTitles,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String bottomTitle;
  final String trailing;
  final List<String> badgeTitles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF4F5FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset('assets/Profile.png'),
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Color(0xFF5C698B),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xFF5C698B),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.25),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bottomTitle,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0xFF5C698B),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4),
              ),
              Text(
                trailing,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0xFF5C698B),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 6,
            children: [
              for (final item in badgeTitles)
                GestureDetector(
                  onTap: () {
                    Provider.of<AppointProvider>(context, listen: false)
                        .changeStep(Steps.four);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFB499FF),
                            Color(0xFFDACCFF),
                          ],
                          stops: const [0.1, 1.2],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
