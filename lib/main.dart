import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_delikat_h_c/item_widget.dart';

import 'basket_page.dart';
import 'product_class.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delikat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/basket': (context) => BasketPage(
              selektedProducts: productsInBasket,
            ),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<Product> productsInBasket = <Product>[];

class _MainPageState extends State<MainPage> {
  final _products = <Product>[];

  Future<List<Product>> featchProducts() async {
    var url = Uri.http('www.plus-pumba.ru', 'products');
    //var url = Uri.parse('http://www.plus-pumba.ru/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var products = <Product>[];

    if (response.statusCode == 200) {
      var productsJson = json.decode(response.body);
      for (var productJson in productsJson) {
        products.add(Product.fromJson(productJson));
      }
    }
    return products;
  }

  @override
  void initState() {
    featchProducts().then((value) {
      setState(() {
        _products.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          'Delikat',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            // print("build");
            return ItemWidget(product: _products[index]);
          },
          itemCount: _products.length,
        ),
      ),
    );
  }
}
