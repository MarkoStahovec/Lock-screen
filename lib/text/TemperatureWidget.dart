import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../main.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: GoogleFonts.exo2(
          fontSize: defTextSize * 1.8,
          fontWeight: FontWeight.w200,
        ),
        children: <TextSpan>[
          TextSpan(text: '14', style: TextStyle(color: isDarkMode ? darkMainTextColor : lightMainTextColor,)),
          const TextSpan(text: '°', style: TextStyle(color: mainColor)),
        ],
      ),
    );
  }
}
