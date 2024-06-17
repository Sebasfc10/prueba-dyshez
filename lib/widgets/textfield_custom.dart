import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';

class TextFieldCustom extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String iconPath; // Ruta de la imagen
  final bool isPassword;
  final TextEditingController? controller;
  final double? width;
  final double? height;

  const TextFieldCustom({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.iconPath, // Ruta de la imagen requerida
    this.isPassword = false,
    this.controller,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: widget.width ?? MediaQuery.of(context).size.width * 0.8,
      height: widget.height,
      child: TextField(
        controller: _controller,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: fontgrey,
              fontWeight: FontWeight.bold,
              fontFamily: 'Hauora'),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                fontgrey,
                BlendMode.srcIn,
              ),
              child: Image.asset(widget.iconPath),
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(_obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(108),
            borderSide: BorderSide(
              color: bordergrey,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(108),
            borderSide: BorderSide(
              color: bordergrey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(108),
            borderSide: BorderSide(
              color: bordergrey,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  String getText() {
    return _controller.text;
  }
}
