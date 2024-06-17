import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastCustom extends StatelessWidget {
  final String message;
  final String imagePath;
  final double width;
  final double height;
  final FToast fToast;
  final Color borderColor;
  final bool showBorder;

  const ToastCustom({
    Key? key,
    required this.message,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.fToast,
    this.borderColor = Colors.black,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: showBorder
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
              color: Color.fromRGBO(255, 255, 255, 0.8),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(255, 255, 255, 0.8),
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 24.0, height: 24.0),
          SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 12.0),
          GestureDetector(
            onTap: () {
              fToast.removeCustomToast();
            },
            child: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
