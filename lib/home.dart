import 'package:flutter/material.dart';
import 'package:flutter_application_8/cart_model.dart';
import 'package:flutter_application_8/cart_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CartModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Lec'),
        actions: [
          Row(
            children: [
              Consumer<CartModel>(builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    icon: Badge.count(
                        count: data.list.length,
                        child: const Icon(Icons.shopping_cart, size: 30)));
              }),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(10, (index) => index)
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$e',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            data.addToList('$e');
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
