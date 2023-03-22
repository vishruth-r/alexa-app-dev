import 'package:alexa_shopping_app/models/items.dart';
import 'package:flutter/material.dart';
import 'package:alexa_shopping_app/views/cart_page.dart';

import '../service/remote_services.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Welcome> cartItems = [];
  List<Welcome>? items;
  var isLoaded = false;


  @override
  void initState(){
    super.initState();
    getData();

  }
  getData() async {
    items = await RemoteService().getItems();
    if (items != null)
    {
      setState((){
        isLoaded= true;
      });

    }

  }
  void addToCart(Welcome item) {
    setState(() {
      cartItems!.add(item);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amazon', style: TextStyle(color: Colors.black),
      ),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems))
            );

            }, icon: Icon(Icons.shopping_cart_outlined))

    ],

      ),
      
      body: Visibility(

        replacement: const Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
          itemCount: items?.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.network(items![index].image),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items![index].title,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        Text(
                          items![index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$${items![index].price}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              addToCart(items![index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${items![index].title} added to cart!"),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                            },

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}
