import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/widgets/button_custom.dart';
import 'package:prueba_dyshez/widgets/taptext_custom.dart';
import 'package:prueba_dyshez/widgets/textfield_custom.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  'Crear una cuenta',
                  style: TextStyle(
                    color: secondaryColor,
                    fontFamily: 'Poppins',
                    fontSize: size.width * 0.09,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFieldCustom(
                  width: size.width * 0.9,
                  labelText: '',
                  hintText: 'Username',
                  iconPath: 'assets/images/At-regular 1.png',
                  controller: _usernameController,
                ),
                TextFieldCustom(
                  width: size.width * 0.9,
                  labelText: '',
                  hintText: 'Nombre',
                  iconPath: 'assets/images/User.png',
                  controller: _nameController,
                ),
                TextFieldCustom(
                  width: size.width * 0.9,
                  labelText: '',
                  hintText: 'Email',
                  iconPath: 'assets/images/Email.png',
                  controller: _emailController,
                ),
                TextFieldCustom(
                  width: size.width * 0.9,
                  labelText: '',
                  hintText: 'Telefono',
                  iconPath: 'assets/images/Phone.png',
                  controller: _phoneController,
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
                  hintText: 'Verificar contraseña',
                  iconPath: 'assets/images/Password.png',
                  controller: _verifyPasswordController,
                ),
                SizedBox(height: size.height * 0.015),
                CustomButton(
                  width: size.width * 0.85,
                  text: 'Crear una cuenta',
                  onPressed: () {
                    Navigator.pushNamed(context, '/verify_email');
                  },
                  buttonColor: secondaryColor,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Hauora',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  borderRadius: 108,
                  hasBorder: false, // Habilita el borde
                  borderWidth: 2.0, // Grosor del borde
                ),
                SizedBox(height: size.height * 0.02),
                TapTextCustom(
                  colorFontLink: primaryColor,
                  link_text: 'Inicia Sesión',
                  text: '¿Ya tienes cuenta? ',
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  mainFontSize: 14,
                  linkFontSize: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
