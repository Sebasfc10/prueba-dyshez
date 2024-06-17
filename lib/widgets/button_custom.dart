import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor; // Renombrado para evitar confusión
  final TextStyle textStyle;
  final double borderRadius;
  final bool showLeftIcon; // Mostrar icono a la izquierda del texto
  final Widget? leftIcon; // Icono a la izquierda del texto
  final bool showRightIcon; // Mostrar icono a la derecha del texto
  final Widget? rightIcon; // Icono a la derecha del texto
  final double? width;
  final double? height;
  final bool hasBorder; // Nuevo parámetro para habilitar el borde
  final double borderWidth; // Nuevo parámetro para el grosor del borde
  final Color? colorBorder;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue, // Renombrado para evitar confusión
    this.textStyle = const TextStyle(color: Colors.white),
    this.borderRadius = 12.0,
    this.showLeftIcon = false,
    this.leftIcon,
    this.showRightIcon = false,
    this.rightIcon,
    this.width,
    this.height,
    this.hasBorder = false, // Valor por defecto para el borde
    this.borderWidth = 2.0, // Grosor del borde
    this.colorBorder = bordergrey, // Valor por defecto para el color del borde
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: hasBorder
              ? Border.all(color: colorBorder!, width: borderWidth)
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showLeftIcon && leftIcon != null) ...[
                leftIcon!,
                SizedBox(width: 8),
              ],
              Text(
                text,
                style: textStyle,
              ),
              if (showRightIcon && rightIcon != null) ...[
                SizedBox(width: 8),
                rightIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
