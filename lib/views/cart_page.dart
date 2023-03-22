import 'package:flutter/material.dart';
import 'package:alexa_shopping_app/models/items.dart';

import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  final List<Welcome> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}class _CartPageState extends State<CartPage> {
  double getTotalPrice() {
    double totalPrice = 0;
    for (final item in widget.cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }


@override
Widget build(BuildContext context) {
  final groupedCartItems = <String, Welcome>{};

  for (final item in widget.cartItems) {
    if (groupedCartItems.containsKey(item.title)) {
      groupedCartItems[item.title]!.quantity += item.quantity;
    } else {
      groupedCartItems[item.title] = item;
    }
  }

  final cartItemList = groupedCartItems.values.toList();


  return Scaffold(
    appBar: AppBar(
      title: Text('Cart'),
    ),
    body: ListView.builder(
      itemCount: cartItemList.length,
      itemBuilder: (context, index) {
        final cartItem = cartItems[index];
        return ListTile(
          title: Text(cartItem.title),
          subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () {
              setState(() {
                cartItems.removeAt(index);
              });
            },
          ),
        );
      },
    ),
    bottomNavigationBar: Padding(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CheckoutPage(cartItems: cartItems),
            ),
          );
        },
        child: Text('Checkout'),
      ),
    ),
  );
}

