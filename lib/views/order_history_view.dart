import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';
import 'package:prueba_dyshez/models/order_details_model.dart';
import 'package:prueba_dyshez/views/order_detail_view.dart';
import 'package:prueba_dyshez/widgets/item_order_custom.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: Stack(
        children: [_appbar(), _list_orders()],
      ),
    );
  }

  Widget _appbar() {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.04,
        left: size.width * 0.04,
        right: size.width * 0.04,
        child: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.03),
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.1,
                height: size.height * 0.05,
                child: Center(
                  child: Icon(
                    size: size.width * 0.05,
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8)),
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
        ));
  }

  //LOS ITEM SE PUEDEN CONSTRUIR DINAMICAMENTE DESDE EL BACK CON UN LIST Y BUILDER PERO NO ME DIO TIEMPO, ESTO LO HICE EN 2 DIAS, LO SIENTO.
  Widget _list_orders() {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.12,
      left: size.width * 0.05,
      right: size.width * 0.05,
      bottom: size.height * 0.03,
      child: Container(
        width: size.width * 0.9,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Color de la sombra
              spreadRadius: 0, // Extensión de la sombra
              blurRadius: 2, // Desenfoque de la sombra
              offset: Offset(1, 2), // Desplazamiento de la sombra
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.width * 0.05),
                child: Text(
                  'Pedidos anteriores',
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: fontgrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Hauora'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: ItemOrderCustom(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return OrderDetailsViews(
                          label_order: 'label_order',
                          imagepath: 'assets/images/Frame 238030.png',
                        );
                      },
                    ));
                  },
                  imageUrl: 'assets/images/image.png',
                  productName: 'Producto A',
                  quantity: 2,
                  price: 9.99,
                  storeName: 'Tienda B',
                  date: 'Abr 13',
                  status: 'Entregado',
                  customImage: 'assets/images/image.png',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
