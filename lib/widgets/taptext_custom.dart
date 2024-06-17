import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:flutter/gestures.dart';

class TapTextCustom extends StatelessWidget {
  final Color colorFontLink;
  final String text;
  final String link_text;
  final VoidCallback onTap;
  final double mainFontSize;
  final double linkFontSize;

  const TapTextCustom({
    Key? key,
    required this.onTap,
    required this.text,
    this.mainFontSize = 14.0,
    this.linkFontSize = 14.0,
    required this.link_text,
    required this.colorFontLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: secondaryColor,
          fontFamily: 'Hauora',
          fontSize: mainFontSize,
        ),
        children: [
          TextSpan(
            text: link_text,
            style: TextStyle(
              color: colorFontLink.withOpacity(0.7),
              fontFamily: 'Hauora',
              fontSize: linkFontSize,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
