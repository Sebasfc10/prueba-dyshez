import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/widgets/button_custom.dart';

class OrderDetailsViews extends StatefulWidget {
  final String? label_order;
  final String? imagepath;
  const OrderDetailsViews({super.key, this.label_order = '', this.imagepath});

  @override
  State<OrderDetailsViews> createState() => _OrderDetailsViewsState();
}

class _OrderDetailsViewsState extends State<OrderDetailsViews> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height:
                    size.height * 0.04), // Ajuste para el espaciado superior
            _appbar(),
            _detail(),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.1,
            height: size.height * 0.05,
            child: Center(
                child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                size: size.width * 0.05,
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            )),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          ),
          Text(
            'Historial',
            style: TextStyle(
                fontSize: size.width * 0.058,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.menu,
            color: secondaryColor,
            size: size.width * 0.08,
          )
        ],
      ),
    );
  }

  Widget _detail() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Color de la sombra
                  spreadRadius: 0, // Extensión de la sombra
                  blurRadius: 2, // Desenfoque de la sombra
                  offset: Offset(1, 2), // Desplazamiento de la sombra
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: widget.imagepath == null
                  ? Colors.black
                  : null, // Color de fondo negro si no hay imagen
              image: widget.imagepath != null
                  ? DecorationImage(
                      image: AssetImage(widget.imagepath!),
                      fit: BoxFit.cover,
                    )
                  : null, // Solo se establece la imagen si hay una ruta válida
            ),
            child: widget.imagepath == null
                ? Center(
                    child: Text(
                      'No hay imagen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null, // Puedes agregar un widget de texto o algo similar para indicar que no hay imagen
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            width: size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Color de la sombra
                spreadRadius: 0, // Extensión de la sombra
                blurRadius: 2, // Desenfoque de la sombra
                offset: Offset(1, 2), // Desplazamiento de la sombra
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.025, left: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label_order ?? 'ejemplo',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Completado',
                        style: TextStyle(
                            fontFamily: 'Hauora',
                            fontSize: 11,
                            color: greenCompleted,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' · Abr 13 a las 11:53 AM',
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Hauora',
                            fontSize: 11,
                            color: fontgrey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        size: 18,
                        Icons.place_outlined,
                        color: fontgrey,
                      ),
                      Text(
                        ' Benito Juaréz #213',
                        style: TextStyle(
                            fontFamily: 'Hauora',
                            fontSize: 11,
                            color: fontgrey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Tu pedido',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _item_order_detail(
                      'Pizza italiana', '320', false, '240', '2'),
                  _item_order_detail('Pizza italiana', '320', true, '240', '2'),
                  _item_order_detail('Pizza italiana', '320', true, '240', '2'),
                  _item_label_summery('label', 'value', true),
                  _item_label_summery('label', 'value', false),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Divider(
                    color: fontgrey.withOpacity(0.5),
                    height: 10,
                    endIndent: size.width * 0.02,
                    indent: size.width * 0.02,
                  ),
                  _item_pay('ICICI Bank Card', '1111111111', 'visa'),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CustomButton(
                    width: size.width * 0.79,
                    text: 'Reordenar',
                    onPressed: () {},
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
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  CustomButton(
                    width: size.width * 0.79,
                    text: 'Ver recibo',
                    onPressed: () {},
                    buttonColor: Colors.white,
                    textStyle: TextStyle(
                      color: secondaryColor,
                      fontFamily: 'Hauora',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    borderRadius: 108,
                    hasBorder: true, // Habilita el borde
                    borderWidth: 2.0, // Grosor del borde
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _item_order_detail(String name, String price, bool hasDiscount,
      String discountPrice, String amount) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: Text(
                      'x$amount',
                      style: TextStyle(
                          fontFamily: 'Hauora',
                          fontSize: 15,
                          color: accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: accentColor.withOpacity(0.09),
                    radius: size.width * 0.038,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Hauora',
                        fontSize: 15,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (hasDiscount)
                    Text(
                      '\$$price',
                      style: TextStyle(
                          fontFamily: 'Hauora',
                          fontSize: 15,
                          color: fontgrey.withOpacity(0.5),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.lineThrough),
                    ),
                  if (hasDiscount)
                    SizedBox(
                      width: 5,
                    ),
                  Text(
                    hasDiscount ? '\$$discountPrice' : '\$$price',
                    style: TextStyle(
                        fontFamily: 'Hauora',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: fontgrey.withOpacity(0.5),
            height: 10,
            endIndent: size.width * 0.02,
            indent: size.width * 0.02,
          ),
        ),
      ],
    );
  }

  Widget _item_label_summery(String label, String value, bool hasDescuento) {
    final labelColor = hasDescuento ? Colors.red : secondaryColor;
    final displayValue = hasDescuento ? '-\$$value' : '\$$value';
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontFamily: 'Hauora',
                fontSize: 15,
                color: labelColor,
                fontWeight: FontWeight.w500),
          ),
          Text(
            displayValue,
            style: TextStyle(
                fontFamily: 'Hauora',
                fontSize: 15,
                color: labelColor,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _item_pay(String cardName, String cardNumber, String typeBank) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.03, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Metodo de pago',
            style: TextStyle(
                fontFamily: 'Hauora',
                fontSize: 16,
                color: secondaryColor,
                fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/visa logo.png',
                width: size.width * 0.13,
                height: size.height * 0.05,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardName,
                    style: TextStyle(
                        fontFamily: 'Hauora',
                        fontSize: 14,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    cardNumber,
                    style: TextStyle(
                        fontFamily: 'Hauora',
                        fontSize: 11,
                        color: fontgrey,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
