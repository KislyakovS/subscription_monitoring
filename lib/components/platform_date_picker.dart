import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDatePicker extends StatelessWidget {
  PlatformDatePicker({
    Key? key,
    required this.child,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onChangedDate,
  }) : super(key: key);

  final Widget child;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime?) onChangedDate;

  void _onTapShowCupertino(BuildContext context) {
    showCupertinoModalPopup<CupertinoDatePicker>(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: initialDate,
          minimumDate: firstDate,
          maximumDate: lastDate,
          onDateTimeChanged: onChangedDate,
        ),
      ),
    );
  }

  void _onTapShowAndroid(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    onChangedDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Platform.isAndroid
            ? _onTapShowAndroid(context)
            : _onTapShowCupertino(context),
        child: child,
      ),
    );
  }
}
