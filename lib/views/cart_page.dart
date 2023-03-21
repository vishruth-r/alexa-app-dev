import 'package:alexa_shopping_app/models/items.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Welcome> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Image.network(widget.cartItems[index].image),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cartItems[index].title,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.cartItems[index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$${widget.cartItems[index].price}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    setState(() {
                      widget.cartItems.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
