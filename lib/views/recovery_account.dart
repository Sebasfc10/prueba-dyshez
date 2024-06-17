import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/widgets/button_custom.dart';
import 'package:prueba_dyshez/widgets/container_help_soport.dart';
import 'package:prueba_dyshez/widgets/taptext_custom.dart';
import 'package:prueba_dyshez/widgets/textfield_custom.dart';
import 'package:prueba_dyshez/widgets/toast_custom.dart';

class RecoveryAccountView extends StatefulWidget {
  const RecoveryAccountView({Key? key}) : super(key: key);

  @override
  State<RecoveryAccountView> createState() => _RecoveryAccountViewState();
}

class _RecoveryAccountViewState extends State<RecoveryAccountView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _verify_email()
        //_send_verify_email()
        );
  }

  Widget _verify_email() {
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
                'Recuperar Cuenta',
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
                hintText: 'Email',
                iconPath: 'assets/images/User.png',
                controller: _emailController,
              ),
              SizedBox(height: size.height * 0.015),
              CustomButton(
                width: size.width * 0.85,
                text: 'Restablecer',
                onPressed: () {
                  Navigator.pushNamed(context, '/change_password');
                },
                buttonColor: secondaryColor,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Hauora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: 108,
                showLeftIcon: false,
                showRightIcon: true,
                rightIcon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                hasBorder: false,
                borderWidth: 2.0,
              ),
              SizedBox(height: size.height * 0.02),
              TapTextCustom(
                colorFontLink: primaryColor,
                link_text: 'Crea una nueva cuenta',
                text: '¿No tienes cuenta? ',
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
    );
  }
}
