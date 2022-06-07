import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../main.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  String nowMinute = '', nowHour = '', nowSeconds = '';
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        nowMinute = DateTime.now().minute.toString().padLeft(2, "0");
        nowHour = DateTime.now().hour.toString().padLeft(2, "0");
        nowSeconds = DateTime.now().second.toString().padLeft(2, "0");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: GoogleFonts.exo2(
          fontSize: defTextSize * 2.4,
          fontWeight: FontWeight.w200,
        ),
        children: <TextSpan>[
          TextSpan(text: nowHour.toString() + "." + nowMinute.toString(), style: TextStyle(color: isDarkMode ? darkMainTextColor : lightMainTextColor,)),
        ],
      ),
    );
  }
}

