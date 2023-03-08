import 'package:flutter/material.dart';
import 'package:flutter_delikat_h_c/basketitem_widget.dart';
import 'product_class.dart';

class BasketPage extends StatefulWidget {
  BasketPage({super.key, required this.selektedProducts});
  final selektedProducts;

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  List<Product> _selektedProducts = <Product>[];
  @override
  void initState() {
    _selektedProducts = widget.selektedProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Basket',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 1,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            print("build");
            return BasketItemWidget(product: _selektedProducts[index]);
          },
          itemCount: _selektedProducts.length,
        ),
      ),
    );
  }
}
