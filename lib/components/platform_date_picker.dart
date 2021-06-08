import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_monitoring/utils/utils.dart';

class PlatformDatePicker extends StatefulWidget {
  PlatformDatePicker({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onChangedDate,
  }) : super(key: key);

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime) onChangedDate;

  @override
  _PlatformDatePickerState createState() => _PlatformDatePickerState();
}

class _PlatformDatePickerState extends State<PlatformDatePicker> {
  late String value;

  @override
  void initState() {
    super.initState();

    value = Utils.formatDate(time: widget.initialDate);
  }

  void _onTapShowCupertino(BuildContext context) {
    showCupertinoModalPopup<CupertinoDatePicker>(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: widget.initialDate,
          minimumDate: widget.firstDate,
          maximumDate: widget.lastDate,
          onDateTimeChanged: (date) {
            setState(() {
              value = Utils.formatDate(time: date);
            });
            widget.onChangedDate(date);
          },
        ),
      ),
    );
  }

  void _onTapShowAndroid(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.initialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (date != null) {
      setState(() {
        value = Utils.formatDate(time: date);
      });

      widget.onChangedDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Platform.isAndroid
            ? _onTapShowAndroid(context)
            : _onTapShowCupertino(context),
        child: Text(value),
      ),
    );
  }
}
