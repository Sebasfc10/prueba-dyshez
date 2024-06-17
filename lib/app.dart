import 'package:flutter/material.dart';
import 'package:prueba_dyshez/views/change_password.dart';
import 'package:prueba_dyshez/views/order_detail_view.dart';
import 'package:prueba_dyshez/views/order_history_view.dart';
import 'package:prueba_dyshez/views/recovery_account.dart';
import 'package:prueba_dyshez/views/signup_view.dart';
import 'package:prueba_dyshez/views/verify_email.dart';
import 'views/login_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Demo',
      home: const LoginView(),
      initialRoute: '/login', // Ruta inicial de la aplicación
      routes: {
        '/login': (context) =>
            const LoginView(), // Ruta para la vista de inicio de sesión
        '/signup': (context) =>
            const SignUpView(), // Ruta para la vista de creacion de cuentas
        '/verify_email': (context) =>
            const VerifyEmailView(), // Ruta para la vista de verificacion de cuenta
        '/recovery_account': (context) =>
            const RecoveryAccountView(), //Ruta para la vista de recuperacion de cuenta
        '/change_password': (context) =>
            const ChangePasswordView(), //Ruta para la vista de cambio de contraseña
        '/order_history': (context) =>
            const OrderHistoryView(), //Ruta para la vista de historial de pedidos
        '/order_details': (context) =>
            const OrderDetailsViews(), //Ruta para la vista de detalles de pedido
      },
    );
  }
}
