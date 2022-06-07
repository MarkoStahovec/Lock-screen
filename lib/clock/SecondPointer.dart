import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as BS;

import '../constants.dart';
import '../main.dart';

class SecondPointer extends StatelessWidget {
  const SecondPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final second = DateTime.now().second.toDouble();
    final angleSecond = (-pi * (second / -60)) * 2;
    final width = MediaQuery.of(context).size.width;
    Offset offset = offsetPress;
    double blur = blurButton;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angleSecond,
        child: Transform.translate(
          offset: const Offset(0, 32),
          child: Center(
            child: Material(
              elevation: 7,
              shadowColor: lightPointerShadow,
              borderRadius: BorderRadius.circular(defRadius * 2),
              child: Container(
                height: width * 0.2,
                width: width * 0.025,
                decoration: BS.BoxDecoration(
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
