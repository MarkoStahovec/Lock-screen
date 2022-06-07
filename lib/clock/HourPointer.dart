import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class HourPointer extends StatelessWidget {
  const HourPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final hour = double.parse((DateFormat('hh').format(DateTime.now())));
    final hour = DateTime.now().hour.toDouble();
    final minute = DateTime.now().minute.toDouble();
    final angle = (-pi * ((hour + minute/60) / -12)) * 2;
    final width = MediaQuery.of(context).size.width;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: const Offset(0, 34),
          child: Center(
            child: Material(
              elevation: 7,
              shadowColor: lightPointerShadow,
              borderRadius: BorderRadius.circular(defRadius * 2),
              child: Container(
                height: width * 0.09,
                width: width * 0.03,
                decoration: BoxDecoration(
                  color: mainColor,
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