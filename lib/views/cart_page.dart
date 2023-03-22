import 'package:flutter/material.dart';
import 'package:alexa_shopping_app/models/items.dart';

class CartPage extends StatefulWidget {
  final List<Welcome> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(
        child: Text('Your cart is empty'),
      )
          : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            leading: Image.network(item.image),
            title: Text(item.title),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    if (item.quantity > 1) {
                      setState(() {
                        item.quantity--;
                      });
                    } else {
                      setState(() {
                        widget.cartItems.removeAt(index);
                      });
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                Text('\$${item.price * item.quantity}'),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: widget.cartItems.isEmpty
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
                  'Total: \$${_getTotalPrice(widget.cartItems)}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/checkout', arguments: {'cartItems': widget.cartItems});
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
