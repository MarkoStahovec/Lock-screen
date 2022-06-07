import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as BS;

import '../constants.dart';
import '../main.dart';

class AnalogCircle extends StatelessWidget {
  const AnalogCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    bool isPressed = false;
    bool isPortrait = height > width;
    Offset offset = isPressed ? offsetPress : offsetNonPress;
    double blur = blurButton;
    final squareSideLength = width / buttonSizeMultiplier;
    final buttonSize = Size(squareSideLength, squareSideLength);
    return Container(
      height: width * 0.7,
      width: width * 0.7,
      decoration: BS.BoxDecoration(
        //borderRadius: BorderRadius.circular(100),
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: isDarkMode ? [
            darkLeftShadow,
            darkRightShadow,
          ]
              : [
            lightLeftShadow,
            lightRightShadow,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BS.BoxShadow(
          color: isDarkMode ? darkLeftShadow : lightLeftShadow,
            offset: -offset,
            blurRadius: blur / 1.4,
            spreadRadius: 0.0,
            inset: false,
          ),
          BS.BoxShadow(
            color: isDarkMode ? darkRightShadow : lightRightShadow,
            offset: offset,
            blurRadius: blur / 1.4,
            spreadRadius: 0.0,
            inset: false,
          ),
      ],
    ),
      child: Padding(
          padding: const EdgeInsets.all(defaultPadding * 2.6),
          child: Container(
            decoration: BS.BoxDecoration(
              //borderRadius: BorderRadius.circular(100),
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: isDarkMode ? [
                  darkLeftShadow,
                  darkRightShadow,
                ]
                    : [
                  lightRightShadow,
                  lightLeftShadow,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BS.BoxShadow(
                  color: isDarkMode ? darkRightShadow : lightRightShadow,
                  offset: -offset,
                  blurRadius: blur,
                  spreadRadius: 0.0,
                  inset: false,
                ),
                BS.BoxShadow(
                  color: isDarkMode ? darkLeftShadow : lightLeftShadow,
                  offset: offset,
                  blurRadius: blur,
                  spreadRadius: 0.0,
                  inset: false,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
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
                      offset: -offset,
                      blurRadius: blur / 1.4,
                      spreadRadius: 0.0,
                      inset: false,
                    ),
                    BS.BoxShadow(
                      color: isDarkMode ? darkRightShadow : secondaryLightRightClockShadow,
                      offset: offset,
                      blurRadius: blur / 1.4,
                      spreadRadius: 0.0,
                      inset: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
