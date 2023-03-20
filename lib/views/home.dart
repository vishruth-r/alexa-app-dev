import 'package:alexa_shopping_app/models/items.dart';
import 'package:flutter/material.dart';


import '../service/remote_services.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('jewelery', style: TextStyle(fontWeight: FontWeight.bold
                          ),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.grid_view_outlined)),
                ],
              ),
            ListView.builder(itemBuilder: (context, index) =>
              Row(
                children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black

                  ),
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  child: Text("Tshirt",style: TextStyle(color: Colors.white
    ),
    ),
                )
                ]
                )
                ,)

            ],
          )
        ),
      ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: BackButton(),
      title: Text("Amazon",
      style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {
              // Handle search button press
            },
            icon: Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () {
              // Handle shopping cart button press
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ]
    );
  }
}
