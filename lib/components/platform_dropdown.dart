import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDropdown extends StatefulWidget {
  const PlatformDropdown({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    required this.onChanged,
  }) : super(key: key);

  final int initialIndex;
  final List<String> items;
  final void Function(String?) onChanged;

  @override
  _PlatformDropdownState createState() => _PlatformDropdownState();
}

class _PlatformDropdownState extends State<PlatformDropdown> {
  late String value;

  @override
  void initState() {
    super.initState();

    value = widget.items[widget.initialIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? _buildAndroidDropdown(context)
        : _buildCupertinoDropdown(context);
  }

  void _onTapShowPicker(BuildContext context) {
    showCupertinoModalPopup<CupertinoDatePicker>(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: Colors.white,
        child: CupertinoPicker(
          scrollController:
              FixedExtentScrollController(initialItem: widget.initialIndex),
          itemExtent: 40,
          onSelectedItemChanged: (int index) {
            setState(() {
              value = widget.items[index];
              widget.onChanged(value);
            });
          },
          children: widget.items
              .map(
                (it) => Center(
                  child: Text(it),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  DropdownButton _buildAndroidDropdown(BuildContext context) {
    return DropdownButton<String>(
      value: widget.items[widget.initialIndex],
      onChanged: (value) {
        widget.onChanged(value);
      },
      items: widget.items
          .map(
            (it) => DropdownMenuItem(
              value: it,
              child: Text(it),
            ),
          )
          .toList(),
    );
  }

  GestureDetector _buildCupertinoDropdown(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapShowPicker(context),
      child: Text(value),
    );
  }
}
