import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[200],
      body: Column(children: [
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
                          ),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                    ),
                  )
                  IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_alt))
                  ],
              ),
              Row(
                children: [
                  Container(
                    child: Text("electronics"),
                  )
                ],
              ),
            ],
          ),
        )
      ],),
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