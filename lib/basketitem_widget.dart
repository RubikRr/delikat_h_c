import 'package:flutter/material.dart';
import 'package:flutter_delikat_h_c/product_class.dart';
import 'package:flutter_delikat_h_c/product_detail.dart';

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetail(
            product: product,
          );
        }));
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.green,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product.img,
              child: SizedBox(
                width: 150,
                //child: Image.asset(product.img),
                child: Image.asset('assets/img1.png'),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              'Rub ${product.price}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            // Text(
            //   product.quantity,
            //   style: const TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
            const SizedBox(
              width: 4,
            ),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: const [
                    Icon(
                      Icons.add_shopping_cart,
                      size: 20,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Beli",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.remove_circle_outline,
                      size: 18,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('0'),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      size: 18,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
