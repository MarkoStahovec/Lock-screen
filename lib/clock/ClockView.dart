import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as BS;
import '../constants.dart';
import '../main.dart';
import '../text/TemperatureWidget.dart';
import 'AnalogCircle.dart';
import 'HourPointer.dart';
import 'MinutePointer.dart';
import 'SecondPointer.dart';

class ClockView extends StatelessWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
          Duration(seconds: 1)
      ),
      builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnalogCircle(),
                  HourPointer(),
                  MinutePointer(),
                  Material(
                    elevation: 10,
                    shadowColor: lightPointerShadow,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BS.BoxDecoration(
                        //borderRadius: BorderRadius.circular(100),
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: isDarkMode ? [
                            darkLeftShadow,
                            darkRightShadow,
                          ]
                              : [
                            secondaryLightLeftClockShadow,
                            secondaryLightRightClockShadow,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BS.BoxShadow(
                            color: isDarkMode ? darkLeftShadow : secondaryLightLeftClockShadow,
                            offset: -offsetPress,
                            blurRadius: blurButton / 1.4,
                            spreadRadius: 0.0,
                            inset: false,
                          ),
                          BS.BoxShadow(
                            color: isDarkMode ? darkRightShadow : secondaryLightRightClockShadow,
                            offset: offsetPress,
                            blurRadius: blurButton / 1.4,
                            spreadRadius: 0.0,
                            inset: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ),
            ],
          ),
        );
      }
    );
  }
}
