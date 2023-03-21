import 'package:alexa_shopping_app/views/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:alexa_shopping_app/views/home_page.dart';
import 'package:alexa_shopping_app/models/items.dart';


void main() {  List<Welcome> cartItems = []; // Define cartItems here

runApp(MyApp(cartItems: cartItems));
}
MaterialColor myColor = MaterialColor(0xFFFFFFFF, {
  50: Color(0xFFECEFF1),
  100: Color(0xFFCFD8DC),
  200: Color(0xFFB0BEC5),
  300: Color(0xFF90A4AE),
  400: Color(0xFF78909C),
  500: Color(0xFF607D8B),
  600: Color(0xFF546E7A),
  700: Color(0xFF455A64),
  800: Color(0xFF37474F),
  900: Color(0xFF263238),
});

class MyApp extends StatelessWidget {
  final List<Welcome> cartItems;

  const MyApp({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: HomePage(),
        initialRoute: '/',
        routes: {
          '/cart': (context) => CartPage(cartItems: cartItems),}
    );
  }
}
