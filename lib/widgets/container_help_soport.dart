import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';

class SupportContactWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final double wid;
  final double hei;
  final Color borderColor;

  const SupportContactWidget({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.borderColor,
    required this.wid,
    required this.hei,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wid,
      height: hei,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            /*   width: size * 0.6,
            height: size * 0.6, */
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Hauora',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: fontgrey,
            ),
          ),
        ],
      ),
    );
  }
}
