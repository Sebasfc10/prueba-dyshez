import 'package:flutter/material.dart';
import 'package:prueba_dyshez/config/colors.dart';

class ItemOrderCustom extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final int quantity;
  final double price;
  final String storeName;
  final String date;
  final String status;
  final VoidCallback onTap;
  final String customImage; // Nueva imagen agregada

  const ItemOrderCustom({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.storeName,
    required this.date,
    required this.status,
    required this.onTap,
    required this.customImage, // Nuevo parámetro para la imagen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                // Imagen circular
                CircleAvatar(
                  backgroundImage: AssetImage(imageUrl),
                  radius: 30,
                ),
                const SizedBox(width: 16),
                // Lista organizada de forma vertical
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,
                          style: TextStyle(
                              fontFamily: 'Hauora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(
                          '$quantity artículos · \$${price.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Hauora',
                              color: fontgrey)),
                      Text(storeName,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Hauora',
                              color: fontgrey)),
                      Row(
                        children: [
                          Text('$date -',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: fontgrey,
                                  fontFamily: 'Hauora')),
                          Text(' $status',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: fontgrey,
                                  fontFamily: 'Hauora')),
                        ],
                      ),
                    ],
                  ),
                ),
                // Imagen personalizada en lugar del icono ABC
                Image.asset(
                  customImage,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 16),
                // Icono de arroz (iOS)
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: fontgrey,
                  fill: 0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(
                color: fontgrey.withOpacity(0.5),
                height: 10,
                endIndent: size.width * 0.02,
                indent: size.width * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
