import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/widgets/button_custom.dart';
import 'package:prueba_dyshez/widgets/taptext_custom.dart';
import 'package:prueba_dyshez/widgets/textfield_custom.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment:
                Alignment.topCenter, // Alineación hacia arriba en el centro
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo@2x.png',
                  width: size.width * 0.2,
                  scale: 0.5,
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Cambiar Contraseña',
                  style: TextStyle(
                    height: 1,
                    color: secondaryColor,
                    fontFamily: 'Poppins',
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFieldCustom(
                  isPassword: true,
                  width: size.width * 0.9,
                  labelText: '',
                  hintText: 'Contraseña',
                  iconPath: 'assets/images/Password.png',
                  controller: _passwordController,
                ),
                TextFieldCustom(
                  isPassword: true,
                  width: size.width * 0.9,
                  labelText: '',
                  hintText: 'Verificar nueva contraseña',
                  iconPath: 'assets/images/Password.png',
                  controller: _verifyPasswordController,
                ),
                SizedBox(height: size.height * 0.015),
                CustomButton(
                  width: size.width * 0.85,
                  text: 'Cambiar contraseña',
                  onPressed: () {},
                  buttonColor: secondaryColor,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Hauora',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  borderRadius: 108,
                  showLeftIcon: false, // Mostrar icono a la izquierda
                  showRightIcon: true, // Mostrar icono a la derecha
                  rightIcon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ), // Icono a la derecha
                  hasBorder: false, // Habilita el borde
                  borderWidth: 2.0, // Grosor del borde
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  textAlign: TextAlign.center,
                  'Si no fuiste tu ignora este mensaje o reporte',
                  style: TextStyle(
                    color: secondaryColor,
                    fontFamily: 'Hauora',
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
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
