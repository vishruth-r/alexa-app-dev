import 'package:flutter/material.dart';
import 'package:alexa_shopping_app/models/items.dart';

class CartPage extends StatelessWidget {
  final List<Welcome> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text('Your cart is empty'),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.network(cartItems![index].image),
            title: Text(item.title),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('\$${item.price}'),
          );
        },
      ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Total: \$${_getTotalPrice(cartItems)}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout',
                      arguments: cartItems);
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getTotalPrice(List<Welcome> items) {
    double total = 0.0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
