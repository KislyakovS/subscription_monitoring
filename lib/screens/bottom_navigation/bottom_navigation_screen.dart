import 'package:flutter/material.dart';
import 'package:subscription_monitoring/screens/calendar_screen/calendar_screen.dart';
import 'package:subscription_monitoring/screens/home_screen/home_screen.dart';
import 'package:subscription_monitoring/screens/list_subscription_screen/list_subscription_screen.dart';
import 'package:subscription_monitoring/screens/settings_screen/settings_screen.dart';
import 'package:subscription_monitoring/screens/statistics_screen/statistics_screen.dart';

import '../../colors.dart';

class ButtomNavigationScreen extends StatefulWidget {
  static String routeName = 'buttom_navigation';

  @override
  _ButtomNavigationScreenState createState() => _ButtomNavigationScreenState();
}

class _ButtomNavigationScreenState extends State<ButtomNavigationScreen> {
  int _currentIndex = 0;

  final _icons = [
    const Icon(Icons.home_filled),
    const Icon(Icons.bar_chart),
    const Icon(Icons.add),
    const Icon(Icons.calendar_today_rounded),
    const Icon(Icons.settings)
  ];

  final _screens = [
    HomeScreen(),
    StatisticsScreen(),
    ListSubscriptionScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];

  void _onTapNavItem(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: defaultBackground,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _icons.length,
              (index) => index != 2
                  ? _buildBaseButton(index)
                  : _buildCircleButton(index),
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildBaseButton(int index) {
    return IconButton(
      icon: _icons[index],
      color: _currentIndex == index
          ? colorSelectedNavItem
          : colorUnselectedNavItem,
      onPressed: () => _onTapNavItem(index),
    );
  }

  ElevatedButton _buildCircleButton(int index) {
    return ElevatedButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(12)),
        shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      onPressed: () => _onTapNavItem(index),
      child: _icons[index],
    );
  }
}
