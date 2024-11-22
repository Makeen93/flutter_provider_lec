import 'package:flutter/material.dart';
import 'package:flutter_application_8/cart_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<CartModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value.list[index]),
                  trailing: IconButton(
                      onPressed: () {
                        value.removeFromList(value.list[index]);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
