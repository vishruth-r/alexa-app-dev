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
      appBar: AppBar(title: const Text('Home')
      ),
      
      body: Visibility(
        replacement: const Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
          itemCount: items?.length,
          itemBuilder: (context, index){
          return Container(
            child: Text(items![index].title),

          );
        },),
      ),
    );
  }
}
