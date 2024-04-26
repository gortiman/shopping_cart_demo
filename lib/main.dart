import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/cart_provider/product_cart_provider.dart';
import 'package:shopping_cart_provider/screens/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> ProductCartProvider(),
        child: Builder(builder: (BuildContext context){
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
            ),
            home: const ProductList(),
          );
        }),

    );
  }
}


//https://github.com/axiftaj/Flutter-Shopping-Cart-With-Provider/blob/main/lib/product_list.dart