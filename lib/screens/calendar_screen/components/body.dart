import 'package:flutter/material.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/screens/calendar_screen/components/list_subscription.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/event_calendare.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Subscription> _selectedSubscription = [];
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedSubscription = filterSubscription(_selectedDay);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _selectedSubscription = filterSubscription(selectedDay);
      });
    }
  }

  List<Subscription> filterSubscription(DateTime date) {
    return demoSubscriptions
        .where((sub) => isSameDay(date, sub.endDate))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EventCalendare<Subscription>(
              onDaySelected: _onDaySelected,
              selectedDay: _selectedDay,
              eventLoader: filterSubscription,
            ),
            const SizedBox(height: 20),
            ListSubscription(
              subscriptions: _selectedSubscription,
              date: _selectedDay,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
