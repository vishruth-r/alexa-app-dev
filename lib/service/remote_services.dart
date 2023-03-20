

import 'package:alexa_shopping_app/models/items.dart';
import 'package:http/http.dart' as http;
class RemoteService
{
  Future<List<Welcome>?> getItems() async
  {
    var client = http.Client();

    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);
    if(response.statusCode == 200)
    {
      var json = response.body;
      return welcomeFromJson(json);
    }
  }
}
