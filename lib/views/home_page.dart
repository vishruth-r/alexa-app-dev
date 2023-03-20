import 'package:alexa_shopping_app/models/items.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome>? items;
  var isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Container(
          child: Text("aisudssfkn"),
        );
      },),
    );
  }
}
