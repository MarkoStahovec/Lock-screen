import 'package:flutter/material.dart';
import 'dart:math';

import '../constants.dart';

class MinutePointer extends StatelessWidget {
  const MinutePointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minute = DateTime.now().minute.toDouble();
    final angleMinute = (-pi * (minute / -60)) * 2;
    final width = MediaQuery.of(context).size.width;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angleMinute,
        child: Transform.translate(
          offset: const Offset(0, 48),
          child: Center(
            child: Material(
              elevation: 7,
              shadowColor: lightPointerShadow,
              borderRadius: BorderRadius.circular(defRadius * 2),
              child: Container(
                height: width * 0.15,
                width: width * 0.03,
                decoration: BoxDecoration(
                  color: neutralColor,
                  borderRadius: BorderRadius.circular(defRadius * 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}