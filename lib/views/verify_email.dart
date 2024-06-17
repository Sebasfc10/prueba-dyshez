import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/widgets/button_custom.dart';
import 'package:prueba_dyshez/widgets/container_help_soport.dart';
import 'package:prueba_dyshez/widgets/taptext_custom.dart';
import 'package:prueba_dyshez/widgets/textfield_custom.dart';
import 'package:prueba_dyshez/widgets/toast_custom.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  late FToast fToast;
  bool _isEmailSent = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void _showCustomToast() {
    fToast.showToast(
      child: ToastCustom(
        message: "Link enviado a tu teléfono",
        imagePath: 'assets/images/Square.png',
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.06,
        fToast: fToast,
        borderColor: Color.fromRGBO(103, 189, 109, 0.5),
        showBorder: true,
      ),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isEmailSent ? _send_verify_email() : _send_email(),
    );
  }

  Widget _send_email() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topCenter,
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
              Text(
                'Enviaremos un código a tu email.',
                style: TextStyle(
                  color: secondaryColor,
                  fontFamily: 'Hauora',
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldCustom(
                width: size.width * 0.9,
                labelText: '',
                hintText: 'Email',
                iconPath: 'assets/images/Email.png',
                controller: _emailController,
              ),
              SizedBox(height: size.height * 0.015),
              CustomButton(
                width: size.width * 0.85,
                text: 'Confirmar',
                onPressed: () {
                  _showCustomToast();
                  setState(() {
                    _isEmailSent = true;
                  });
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
                  /*  Navigator.pushNamed(context, '/verify_email'); */
                },
                mainFontSize: 14,
                linkFontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _send_verify_email() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo@2x.png',
                width: size.width * 0.2,
                scale: 0.5,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                textAlign: TextAlign.center,
                'Te hemos enviado un código de verificación',
                style: TextStyle(
                  height: 1,
                  color: secondaryColor,
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                textAlign: TextAlign.center,
                'Hemos enviado un codigo de verificación a tu email, por favor verificalo e ingresalo.',
                style: TextStyle(
                  height: 1,
                  color: secondaryColor,
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Pinput(
                length: 6,
                controller: _pinController,
                mainAxisAlignment: MainAxisAlignment.center,
                onCompleted: (pin) {
                  print('Pin ingresado: $pin');
                  print('redirige a order');
                  Navigator.pushNamed(context, '/order_history');
                },
                defaultPinTheme: PinTheme(
                  width: size.width * 0.1,
                  height: size.height * 0.06,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: fontgrey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),
              TapTextCustom(
                colorFontLink: fontgrey,
                link_text: 'Solicitar nuevamente',
                text: '¿No tienes ningún código de verificación? \n',
                onTap: () {
                  /*  Navigator.pushNamed(context, '/login'); */
                  _showCustomToast(); //Para enviar de nuevo el correo de verificacion
                },
                mainFontSize: 14,
                linkFontSize: 14,
              ),
              SizedBox(height: size.height * 0.04),
              SupportContactWidget(
                imagePath: 'assets/images/Vector.png',
                text: '¿Necesitas más ayuda? Contacta a soporte',
                wid: size.width * 0.8,
                hei: size.height * 0.1,
                borderColor: fontgrey.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
