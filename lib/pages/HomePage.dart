import 'package:custom_clock/clock/ClockView.dart';
import 'package:custom_clock/text/TemperatureWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as BS;
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../main.dart';
import '../text/TimeWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isUnlockPressed = false;
  bool state = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double blur = blurButton;
    final squareSideLength = width / buttonSizeMultiplier;
    final buttonSize = Size(squareSideLength, squareSideLength);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode ? [
                darkLeftBackgroundColor,
                darkRightBackgroundColor,
              ]
                  : [
                lightLeftBackgroundColor,
                lightRightBackgroundColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding * 1.5,),
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 3,),
                TemperatureWidget(),
                const SizedBox(height: defaultPadding * 4,),
                Center(
                  child: ClockView(),
                ),
                const SizedBox(height: defaultPadding * 4,),
                TimeWidget(),
                const SizedBox(height: defaultPadding * 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CupertinoSwitch(
                          activeColor: isDarkMode ? activeThumbColor : neutralColor,
                          thumbColor: neutralColor,
                          //trackColor: isDarkMode ? darkLeftShadow : lightLeftShadow,
                          value:isDarkMode,
                          onChanged: (value){
                            setState(() {
                              isDarkMode = !isDarkMode;
                            });
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: GoogleFonts.exo2(
                              fontSize: defTextSize * 0.75,
                              fontWeight: FontWeight.w300,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "DARK", style: TextStyle(color: isDarkMode ? darkMainTextColor : lightMainTextColor,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    /*
                    SizedBox(
                      width: buttonSize.width,
                      height: buttonSize.height,
                      child: Listener(
                        onPointerUp: (_) => setState(() => isUnlockPressed = false),
                        onPointerDown: (_) => setState(() => isUnlockPressed = true),
                        child:
                        AnimatedContainer(
                          curve: Curves.easeOutExpo,
                          duration: const Duration(milliseconds: animationTime * 2),
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
                                offset: -(isUnlockPressed ? offsetPress : offsetNonPress) * 1.2,
                                blurRadius: (isUnlockPressed ? blur : blur * 3),
                                spreadRadius: 0.0,
                                inset: isUnlockPressed,
                              ),
                              BS.BoxShadow(
                                color: isDarkMode ? darkRightShadow : secondaryLightRightClockShadow,
                                offset: (isUnlockPressed ? offsetPress : offsetNonPress) * 1.2,
                                blurRadius: (isUnlockPressed ? blur : blur * 3),
                                spreadRadius: 0.0,
                                inset: isUnlockPressed,
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment(0, 0),
                            child: IconButton(
                              color: mainColor,
                              onPressed: () async {

                              },
                              icon: const Icon(CupertinoIcons.play_arrow_solid),
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: buttonSize.width * 2.4,
                      height: buttonSize.height / 7,
                      child: Material(
                        elevation: 5,
                        shadowColor: swipeBarShadow,
                        borderRadius: BorderRadius.circular(defRadius * 2),
                        child: Container(
                          decoration: BS.BoxDecoration(
                            borderRadius: BorderRadius.circular(defRadius * 2),
                            //shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: isDarkMode ? [
                                darkTopSwipeBarColor,
                                darkBottomSwipeBarColor,
                              ]
                                  : [
                                lightTopSwipeBarColor,
                                lightBottomSwipeBarColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BS.BoxShadow(
                                color: isDarkMode ? darkTopSwipeBarColor : lightTopSwipeBarColor,
                                offset: -(isUnlockPressed ? offsetPress : offsetNonPress) * 1.2,
                                blurRadius: (isUnlockPressed ? blur : blur * 3),
                                spreadRadius: 0.0,
                                inset: isUnlockPressed,
                              ),
                              BS.BoxShadow(
                                color: isDarkMode ? darkBottomSwipeBarColor : lightBottomSwipeBarColor,
                                offset: (isUnlockPressed ? offsetPress : offsetNonPress) * 1.2,
                                blurRadius: (isUnlockPressed ? blur : blur * 3),
                                spreadRadius: 0.0,
                                inset: isUnlockPressed,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
