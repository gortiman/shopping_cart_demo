import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/cart_provider/product_cart_provider.dart';

import '../model/product_model.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart =Provider.of<ProductCartProvider>(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("MyProduct List",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FutureBuilder(
                future: cart.getDataList(),
                builder: (context, AsyncSnapshot<List<ProductModel>> snapshot){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image(
                                    width:100,
                                      height: 100,
                                      image: NetworkImage(snapshot.data![index].productImage.toString())
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(snapshot.data![index].productName.toString(),
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                                            ),
                                            Icon(Icons.delete)
                                          ],
                                        ),
                                        Text(snapshot.data![index].productUnit.toString()+" "+r"$"+snapshot.data![index].initialPrice.toString(),
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Center(child: Text("Remove",style: TextStyle(color: Colors.white))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
            })
          ],
        ),
      ),
    );
  }
}
