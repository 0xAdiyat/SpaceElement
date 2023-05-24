import 'package:flutter/material.dart';

class DuelText extends StatelessWidget {
  final String firstTxt, lastTxt;
  final double firstTxtFontSize, lastTxtFontSize;
  final String firstTxtFontFamily, lastTxtFontFamily;
  double? lineHeight;

  DuelText(
      {Key? key,
      required this.firstTxt,
      required this.lastTxt,
      required this.firstTxtFontSize,
      required this.lastTxtFontSize,
      required this.firstTxtFontFamily,
      required this.lastTxtFontFamily,
      this.lineHeight = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstTxt,
            style: TextStyle(
              fontSize: firstTxtFontSize,
              fontFamily: firstTxtFontFamily,
              height: lineHeight,
            ),
          ),
          TextSpan(
            text: lastTxt,
            style: TextStyle(
              fontSize: lastTxtFontSize,
              fontFamily: lastTxtFontFamily,
              height: lineHeight,
            ),
          ),
        ],
      ),
    );
  }
}
