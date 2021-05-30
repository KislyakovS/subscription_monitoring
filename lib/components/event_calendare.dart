import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalendare<T> extends StatefulWidget {
  final DateTime selectedDay;
  final void Function(DateTime, DateTime) onDaySelected;
  final List<T> Function(DateTime) eventLoader;

  const EventCalendare({
    Key? key,
    required this.onDaySelected,
    required this.selectedDay,
    required this.eventLoader,
  }) : super(key: key);

  @override
  _EventCalendareState<T> createState() => _EventCalendareState<T>();
}

class _EventCalendareState<T> extends State<EventCalendare> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: TableCalendar<T>(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: widget.selectedDay,
        selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
        onDaySelected: widget.onDaySelected,
        eventLoader: widget.eventLoader as List<T> Function(DateTime),
      ),
    );
  }
}
