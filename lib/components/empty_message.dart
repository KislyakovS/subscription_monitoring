import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const Text(
            'There are no subscriptions yet. \n Click the plus sign to fix it! 😀',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Positioned(
            bottom: 10,
            child: Icon(
              Icons.arrow_downward,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
