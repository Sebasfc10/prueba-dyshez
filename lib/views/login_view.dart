import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/widgets/button_custom.dart';
import 'package:prueba_dyshez/widgets/taptext_custom.dart';
import 'package:prueba_dyshez/widgets/textfield_custom.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                'Iniciar Sesión',
                style: TextStyle(
                  color: secondaryColor,
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //SizedBox(height: 20),
              TextFieldCustom(
                // height: size.width * 0.18,
                width: size.width * 0.9,
                labelText: 'Username',
                hintText: 'Username',
                iconPath: 'assets/images/At-regular 1.png',
                controller: _usernameController,
              ),

              TextFieldCustom(
                //height: size.width * 0.18,
                width: size.width * 0.9,
                labelText: 'Password',
                hintText: 'Password',
                iconPath: 'assets/images/Password.png',
                controller: _passwordController,
              ),

              CustomButton(
                width: size.width * 0.85,
                text: 'Iniciar Sesión',
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  print('Username: $username');
                  print('Password: $password');
                },
                buttonColor: primaryColor,
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
                link_text: 'Crea una nueva cuenta',
                text: '¿No tienes cuenta? ',
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                mainFontSize: 14,
                linkFontSize: 14,
              ),

              Divider(
                color: fontgrey.withOpacity(0.5),
                height: 10,
                endIndent: size.width * 0.02,
                indent: size.width * 0.02,
              ),
              TapTextCustom(
                colorFontLink: primaryColor,
                link_text: 'Recupera tu cuenta',
                text: '¿Olvidaste tu contraseña? ',
                onTap: () {
                  Navigator.pushNamed(context, '/recovery_account');
                },
                mainFontSize: 14,
                linkFontSize: 14,
              ),
              SizedBox(height: size.height * 0.06),
              CustomButton(
                width: size.width * 0.85,
                showLeftIcon: true,
                text: 'Iniciar sesión con Apple ID',
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  print('Username: $username');
                  print('Password: $password');
                },
                buttonColor: Colors.white, // Color del botón
                textStyle: TextStyle(
                  color: secondaryColor,
                  fontFamily: 'Hauora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: 108,
                leftIcon: Image.asset('assets/images/Apple Button Logo.png',
                    height: 24), // Ícono de imagen
                hasBorder: true, // Habilita el borde
                borderWidth: 2.0, // Grosor del borde
              ),
              SizedBox(height: size.height * 0.02),
              CustomButton(
                width: size.width * 0.85,
                showLeftIcon: true,
                text: 'Iniciar sesión con Google',
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  print('Username: $username');
                  print('Password: $password');
                },
                buttonColor: Colors.white, // Color del botón
                textStyle: TextStyle(
                  color: secondaryColor,
                  fontFamily: 'Hauora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: 108,
                leftIcon: Image.asset('assets/images/Google__G__Logo 1.png',
                    height: 24), // Ícono de imagen
                hasBorder: true, // Habilita el borde
                borderWidth: 2.0, // Grosor del borde
              ),
              SizedBox(height: size.height * 0.02),
              CustomButton(
                width: size.width * 0.85,
                showLeftIcon: true,
                text: 'Iniciar sesión con Facebook',
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  print('Username: $username');
                  print('Password: $password');
                },
                buttonColor: Colors.white, // Color del botón
                textStyle: TextStyle(
                  color: secondaryColor,
                  fontFamily: 'Hauora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: 108,
                leftIcon: Image.asset('assets/images/Facebook Button Logo.png',
                    height: 24), // Ícono de imagen
                hasBorder: true, // Habilita el borde
                borderWidth: 2.0, // Grosor del borde
              ),
            ],
          ),
        ),
      ),
    );
  }
}
